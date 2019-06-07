//
//  ArticlesManager.swift
//  QuickieNews
//
//  Created by Nicolas Mulet on 31/05/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class ArticlesManager {
    static let shared = ArticlesManager()
    
    let articlesService: ArticlesService
    
    var currentArticles: [Article]
    let rxArticles = BehaviorSubject<[Article]>(value: [])
    
    var readLaterArticles: [Article]
    let rxReadLaterArticles = BehaviorSubject<[Article]>(value: [])
    
    init() {
        articlesService = ArticlesService()
        currentArticles = []
        readLaterArticles = []
        getArticlesFromCache()
    }
    
    func getAllArticles(from categories: [String], completion: @escaping([Article]) -> Void) {
        currentArticles.removeAll()
        for category in categories {
            getArticles(from: category) { articles in
                completion(self.currentArticles)
            }
        }
    }
    
    private func getArticles(from category: String, completion: @escaping([Article]) -> Void) {
        articlesService.getArticles(from: category) { (status, error, articles) in
            if status == .success, error == nil {
                self.currentArticles.append(contentsOf: articles)
                self.currentArticles.shuffle()
                self.rxArticles.onNext(self.currentArticles)
            }
            
            completion(self.currentArticles)
        }
    }
    
    private func getArticlesFromCache() {
        do {
            if let readLaterArticlesData = UserDefaults.standard.data(forKey: UserPrefs.readLaterArticles),
                let readLaterArticles = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(readLaterArticlesData) as? [Article] {
                self.readLaterArticles = readLaterArticles
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
    
    private func saveReadLaterArticlesToCache() {
        do {
            let encodedArticles = try NSKeyedArchiver.archivedData(withRootObject: readLaterArticles, requiringSecureCoding: false)
            UserDefaults.standard.set(encodedArticles, forKey: UserPrefs.readLaterArticles)
            UserDefaults.standard.synchronize()
        } catch {
            fatalError("Cannot archive readLaterArticles data")
        }
    }
}
