//
//  Article.swift
//  QuickieNews
//
//  Created by Nicolas Mulet on 31/05/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import SwiftyJSON

struct Article {
    let source: Source
    let author: String
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: Date
    let content: String
    
    init(source: Source, author: String, title: String, description: String,
         url: String, urlToImage: String, publishedAt: Date, content: String) {
        self.source = source
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
    }
    
    init?(json: JSON) {
        guard let source = Source(json: json["source"]) else {
            return nil
        }
        
        let author = json["author"].stringValue
        let title = json["title"].stringValue
        let description = json["description"].stringValue
        let url = json["url"].stringValue
        let urlToImage = json["urlToImage"].stringValue
        let publishedAt = json["publishedAt"].date ?? Date()
        let content = json["content"].stringValue
        
        self.init(source: source, author: author, title: title, description: description, url: url, urlToImage: urlToImage, publishedAt: publishedAt, content: content)
    }
}
