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
    }
    
    func getAllArticles(from categories: [String], completion: @escaping([Article]) -> Void) {
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
    
    func addToReadLaterArticles(_ article: Article) {
        readLaterArticles.append(article)
        rxReadLaterArticles.onNext(readLaterArticles)
    }
}
