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
    
    let articlesService: ArticlesService
    
    var currentArticles: [Article]
    
    var readLaterArticles: [Article]
    let rxReadLaterArticles = BehaviorSubject<[Article]>(value: [])
    
    var nopeArticles: [Article]
    
    init() {
        articlesService = ArticlesService()
        currentArticles = []
        readLaterArticles = []
        nopeArticles = []
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
                    results.removeAll(where: { $0.source.id == article.source.id })
                })
                
                // Spotlight
                var searchableItems = [CSSearchableItem]()
                
                articles.forEach({ article in
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
    
    private func getArticlesFromCache() {
        do {
            if let nopeArticlesData = UserDefaults.standard.data(forKey: UserPrefs.nopeArticles),
                let nopeArticles  = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(nopeArticlesData) as? [Article] {
                self.nopeArticles = nopeArticles
            }
            
            if let readLaterArticlesData = UserDefaults.standard.data(forKey: UserPrefs.readLaterArticles),
                let readLaterArticles = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(readLaterArticlesData) as? [Article] {
                self.readLaterArticles = readLaterArticles
                
                self.readLaterArticles.forEach({ article in
                    if self.nopeArticles.contains(where: { $0.source.id == article.source.id }) {
                        self.readLaterArticles.removeAll(where: { $0 == article })
                    }
                })
            }
        } catch {
            print("Cannot unarchive readLaterArticles data")
        }
    }
    
    func addToReadLaterArticles(_ article: Article) {
        readLaterArticles.insert(article, at: 0)
        rxReadLaterArticles.onNext(readLaterArticles)
        
        saveReadLaterArticlesToCache()
    }
    
    func removeFromReadLaterArticles(_ article: Article) {
        readLaterArticles.removeAll(where: { $0.title == article.title })
        rxReadLaterArticles.onNext(readLaterArticles)
        
        saveReadLaterArticlesToCache()
    }
    
    func addToNopeArticles(_ article: Article) {
        nopeArticles.append(article)
        currentArticles.removeAll(where: { $0.source.id == article.source.id })
        
        saveNopeArticlesToCache()
    }
    
    private func saveReadLaterArticlesToCache() {
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
}
