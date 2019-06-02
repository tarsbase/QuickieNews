//
//  CategoriesManager.swift
//  QuickieNews
//
//  Created by Nicolas Mulet on 02/06/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import RxCocoa
import RxSwift

class CategoriesManager {
    
    static let shared = CategoriesManager()
    
    var currentCategories: [String]
    var selectedCategories: [String]
    
    let rxCategories = BehaviorSubject<[String]>(value: [])
    
    init() {
        currentCategories = ["Sport", "Business", "Technology"]
        selectedCategories = []
    }
}
