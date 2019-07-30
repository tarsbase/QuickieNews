//
//  ArticlesManager.swift
//  QuickieNews
//
//  Created by Nicolas Mulet on 31/05/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import CoreSpotlight
import Foundation
import MobileCoreServices
import RxCocoa
import RxSwift

class ArticlesManager {
    static let shared = ArticlesManager()
    
    private let articlesService: ArticlesService
    
    private var currentArticles: [Article]
    private var readArticles: [Article]
    
    var readLaterArticles: [Article]
    let rxReadLaterArticles = BehaviorSubject<[Article]>(value: [])
    
    var orderedBy: ArticleOrder = .timeIncreasing
    
    private var nopeArticles: [Article]
    
    init() {
        articlesService = ArticlesService()
        currentArticles = []
        readLaterArticles = []
        nopeArticles = []
        readArticles = []
        getArticlesFromCache()
    }
    
    func getAllArticles(from categories: [Category], completion: @escaping([Article]) -> Void) {
        currentArticles.removeAll()
        
        var doneCategories = [String]()
        for category in categories {
            getArticles(from: category) { articles in
                doneCategories.append(category.title)
                self.currentArticles.append(contentsOf: articles)
                if doneCategories.count == categories.count {
                    self.currentArticles.shuffle()
                    completion(self.currentArticles)
                }
            }
        }
    }
    
    private func getArticles(from category: Category, completion: @escaping([Article]) -> Void) {
        articlesService.getArticles(from: category.title) { (status, error, articles) in
            var results = articles
            
            if status == .success, error == nil {
                self.nopeArticles.forEach({ article in
                    results.removeAll(where: { $0.title == article.title })
                })
                
                self.readLaterArticles.forEach({ article in
                    results.removeAll(where: { $0.title == article.title })
                })
                
                self.readArticles.forEach({ article in
                    results.removeAll(where: { $0.title == article.title })
                })
                
                // Spotlight
                var searchableItems = [CSSearchableItem]()
                
                results.forEach({ article in
                    article.category = category
                    let searchItemAttributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
                    searchItemAttributeSet.title = article.title
                    searchItemAttributeSet.contentDescription = article.publishedAt.toString()
                    
                    let searchableItem = CSSearchableItem(uniqueIdentifier: article.source.id ?? String.randomString(length: 10),
                                                          domainIdentifier: String(describing: Article.self),
                                                          attributeSet: searchItemAttributeSet)
                    searchableItems.append(searchableItem)
                })
                
                CSSearchableIndex.default().indexSearchableItems(searchableItems) { _ in }
            }
            
            completion(results)
        }
    }
    
    func addToReadLaterArticles(_ article: Article) {
        readLaterArticles.insert(article, at: 0)
        rxReadLaterArticles.onNext(readLaterArticles)
        
        saveReadLaterArticlesToCache()
    }
    
    func removeFromReadLaterArticles(_ article: Article) {
        readLaterArticles.removeAll(where: { $0.title == article.title })
        readArticles.append(article)
        rxReadLaterArticles.onNext(readLaterArticles)
        
        saveReadLaterArticlesToCache()
        saveReadArticlesToCache()
    }
    
    func addToNopeArticles(_ article: Article) {
        nopeArticles.append(article)
        currentArticles.removeAll(where: { $0.title == article.title })
        
        saveNopeArticlesToCache()
    }
}

// MARK: - Later Articles

extension ArticlesManager {
    enum ArticleOrder {
        case timeIncreasing
        case timeDecreasing
        case category
        
        func toString() -> String {
            switch self {
            case .timeIncreasing:
                return R.string.localizable.read_later_sort_date_dec()
            case .timeDecreasing:
                return R.string.localizable.read_later_sort_category()
            case .category:
                return R.string.localizable.read_later_sort_date_inc()
            }
        }
    }
    
    func reorderLaterArticles() {
        switch orderedBy {
        case .timeIncreasing:
            readLaterArticles.sort(by: { $0.publishedAt > $1.publishedAt })
            orderedBy = .timeDecreasing
        case .timeDecreasing:
            readLaterArticles.sort(by: { ($0.category?.title ?? "") > ($1.category?.title ?? "") })
            orderedBy = .category
        case .category:
            readLaterArticles.sort(by: { $0.publishedAt < $1.publishedAt })
            orderedBy = .timeIncreasing
        }
        
        rxReadLaterArticles.onNext(readLaterArticles)
    }
}

// MARK: - Cache

extension ArticlesManager {
    private func getArticlesFromCache() {
        do {
            if let nopeArticlesData = UserDefaults.standard.data(forKey: UserPrefs.nopeArticles),
                let nopeArticles = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(nopeArticlesData) as? [Article] {
                self.nopeArticles = nopeArticles
            }
            
            if let readLaterArticlesData = UserDefaults.standard.data(forKey: UserPrefs.readLaterArticles),
                let readLaterArticles = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(readLaterArticlesData) as? [Article] {
                self.readLaterArticles = readLaterArticles
            }
            
            if let readArticlesData = UserDefaults.standard.data(forKey: UserPrefs.readArticles),
                let readArticles = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(readArticlesData) as? [Article] {
                self.readArticles = readArticles
            }
        } catch {
            print("Cannot unarchive readLaterArticles, nopeArticles and readArticles data")
        }
    }
    
    func saveReadLaterArticlesToCache() {
        do {
            let encodedArticles = try NSKeyedArchiver.archivedData(withRootObject: readLaterArticles, requiringSecureCoding: false)
            UserDefaults.standard.set(encodedArticles, forKey: UserPrefs.readLaterArticles)
            UserDefaults.standard.synchronize()
        } catch {
            fatalError("Cannot archive readLaterArticles data")
        }
    }
    
    private func saveNopeArticlesToCache() {
        do {
            let encodedArticles = try NSKeyedArchiver.archivedData(withRootObject: nopeArticles, requiringSecureCoding: false)
            UserDefaults.standard.set(encodedArticles, forKey: UserPrefs.nopeArticles)
            UserDefaults.standard.synchronize()
        } catch {
            fatalError("Cannot archive nopeArticles data")
        }
    }
    
    private func saveReadArticlesToCache() {
        do {
            let encodedArticles = try NSKeyedArchiver.archivedData(withRootObject: readArticles, requiringSecureCoding: false)
            UserDefaults.standard.set(encodedArticles, forKey: UserPrefs.readArticles)
            UserDefaults.standard.synchronize()
        } catch {
            fatalError("Cannot archive readArticles data")
        }
    }
}
