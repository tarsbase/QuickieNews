//
//  Category.swift
//  QuickieNews
//
//  Created by Nicolas Mulet on 02/07/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import Foundation

class Category: NSObject, NSCoding {
    let emoji: String
    let title: String
    
    init(emoji: String, title: String) {
        self.emoji = emoji
        self.title = title
    }
    
    func toString() -> String {
        return emoji + " " + title
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(emoji, forKey: "emoji")
        aCoder.encode(title, forKey: "title")
    }
    
    required init?(coder aDecoder: NSCoder) {
        emoji = aDecoder.decodeObject(forKey: "emoji") as? String ?? ""
        title = aDecoder.decodeObject(forKey: "title") as? String ?? ""
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        return title == (object as? Category)?.title
    }
}
