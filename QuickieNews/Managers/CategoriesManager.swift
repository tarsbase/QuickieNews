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
    let rxSelectedCategories = BehaviorSubject<[String]>(value: [])
    
    init() {
        currentCategories = ["Sport", "Business", "Technology", "Politics", "Science", "Health"]
        selectedCategories = []
        getSelectedCategories()
    }
    
    private func notifyRx() {
        rxSelectedCategories.onNext(selectedCategories)
    }
    
    private func getSelectedCategories() {
        do {
            if let selectedCategoriesData = UserDefaults.standard.data(forKey: UserPrefs.categories),
                let selectedCategories = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(selectedCategoriesData) as? [String] {
                self.selectedCategories = selectedCategories
                notifyRx()
            }
        } catch {
            print("Cannot unarchive selectedCategories data")
        }
    }
    
    private func saveSelectedCategoriesInCache() {
        do {
            let encodedSelectedCategories = try NSKeyedArchiver.archivedData(withRootObject: selectedCategories, requiringSecureCoding: false)
            UserDefaults.standard.set(encodedSelectedCategories, forKey: UserPrefs.categories)
            UserDefaults.standard.synchronize()
            notifyRx()
        } catch {
            fatalError("Cannot archive selectedCategories data")
        }
    }
    
    func add(selectedCategory: String) {
        selectedCategories.append(selectedCategory)
        saveSelectedCategoriesInCache()
    }
    
    func remove(selectedCategory: String) {
        selectedCategories.remove(at: selectedCategories.firstIndex(of: selectedCategory) ?? 0)
        saveSelectedCategoriesInCache()
    }
    
    func isSelected(_ category: String) -> Bool {
        return selectedCategories.contains(category)
    }
}
