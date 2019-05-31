//
//  Reusable.swift
//  QuickieNews
//
//  Created by Nicolas Mulet on 31/05/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import Foundation

protocol Reusable {
    static func reuseIdentifier() -> String
    static func className() -> String
}

extension Reusable where Self: AnyObject {
    static func reuseIdentifier() -> String {
        return self.className()
    }
    
    static func className() -> String {
        return NSStringFromClass(self).components(separatedBy: ".").last ?? ""
    }
}
