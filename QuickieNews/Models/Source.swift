//
//  Source.swift
//  QuickieNews
//
//  Created by Nicolas Mulet on 31/05/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import SwiftyJSON

struct Source {
    let id: String?
    let name: String
    
    init(id: String?, name: String) {
        self.id = id
        self.name = name
    }
    
    init?(json: JSON) {
        let id = json["id"].string
        let name = json["name"].stringValue
        
        self.init(id: id, name: name)
    }
}
