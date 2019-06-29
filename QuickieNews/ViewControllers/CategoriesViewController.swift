//
//  CategoriesViewController.swift
//  QuickieNews
//
//  Created by Nicolas Mulet on 02/06/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import Hero
import UIKit

class CategoriesViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource

extension CategoriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CategoriesManager.shared.currentCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        if CategoriesManager.shared.currentCategories.indices.contains(indexPath.row) {
            let category = CategoriesManager.shared.currentCategories[indexPath.row]
            cell.textLabel?.text = category
            cell.selectionStyle = .none
            cell.accessoryType = CategoriesManager.shared.isSelected(CategoriesManager.shared.currentCategories[indexPath.row]) ? .checkmark
                                                                                                                                : .none
        }
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension CategoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if CategoriesManager.shared.currentCategories.indices.contains(indexPath.row),
            CategoriesManager.shared.selectedCategories.contains(CategoriesManager.shared.currentCategories[indexPath.row]) {
            let category = CategoriesManager.shared.currentCategories[indexPath.row]
            CategoriesManager.shared.remove(selectedCategory: category)
        } else {
            CategoriesManager.shared.add(selectedCategory: CategoriesManager.shared.currentCategories[indexPath.row])
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
