//
//  Article.swift
//  QuickieNews
//
//  Created by Nicolas Mulet on 31/05/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import SwiftyJSON

class Article: NSObject, NSCoding {
    let source: Source
    let author: String
    let title: String
    let descrip: String
    let url: String
    let urlToImage: String
    let publishedAt: Date
    let content: String
    var category: Category?
    
    init(source: Source, author: String, title: String, description: String,
         url: String, urlToImage: String, publishedAt: Date, content: String) {
        self.source = source
        self.author = author
        self.title = title
        self.descrip = description
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
    }
    
    convenience init?(json: JSON) {
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
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(source, forKey: "source")
        aCoder.encode(author, forKey: "author")
        aCoder.encode(title, forKey: "title")
        aCoder.encode(descrip, forKey: "description")
        aCoder.encode(url, forKey: "url")
        aCoder.encode(urlToImage, forKey: "urlToImage")
        aCoder.encode(publishedAt, forKey: "publishedAt")
        aCoder.encode(content, forKey: "content")
        aCoder.encode(category, forKey: "category")
    }
    
    required init?(coder aDecoder: NSCoder) {
        source = aDecoder.decodeObject(forKey: "source") as? Source ?? Source(id: nil, name: "")
        author = aDecoder.decodeObject(forKey: "author") as? String ?? ""
        title = aDecoder.decodeObject(forKey: "title") as? String ?? ""
        descrip = aDecoder.decodeObject(forKey: "descrip") as? String ?? ""
        url = aDecoder.decodeObject(forKey: "url") as? String ?? ""
        urlToImage = aDecoder.decodeObject(forKey: "urlToImage") as? String ?? ""
        publishedAt = aDecoder.decodeObject(forKey: "publishedAt") as? Date ?? Date()
        content = aDecoder.decodeObject(forKey: "content") as? String ?? ""
        category = aDecoder.decodeObject(forKey: "category") as? Category
    }
}
