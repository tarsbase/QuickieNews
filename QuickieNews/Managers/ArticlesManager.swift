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
    let rx_reports = BehaviorSubject<[Article]>(value: [])
    
    init() {
        articlesService = ArticlesService()
        currentArticles = []
    }
    
    func getArticles(from category: String, completion: @escaping([Article]) -> Void) {
        articlesService.getArticles(from: category) { (status, error, articles) in
            if status == .success, error == nil {
                self.currentArticles.append(contentsOf: articles)
            }
        }
    }
}
