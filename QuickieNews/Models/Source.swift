//
//  Source.swift
//  QuickieNews
//
//  Created by Nicolas Mulet on 31/05/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import SwiftyJSON

class Source: NSObject, NSCoding {
    let id: String?
    let name: String
    
    init(id: String?, name: String) {
        self.id = id
        self.name = name
    }
    
    convenience init?(json: JSON) {
        let id = json["id"].string
        let name = json["name"].stringValue
        
        self.init(id: id, name: name)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(name, forKey: "name")
    }
    
    required init?(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObject(forKey: "id") as? String ?? String.randomString(length: 10)
        name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
    }
}
