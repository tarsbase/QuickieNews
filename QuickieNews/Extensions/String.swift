//
//  String.swift
//  QuickieNews
//
//  Created by Nicolas Mulet on 07/06/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

extension String {
    static let heroArticleReadLater = "ArticleToRead"
    
    static func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map { _ in letters.randomElement() ?? "a" })
    }
}
