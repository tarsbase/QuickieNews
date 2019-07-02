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
        
        setupNavigationBar()
        setupView()
        setupTableView()
    }
    
    private func setupNavigationBar() {
        title = R.string.localizable.categories_title()
    }
    
    private func setupView() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.qnColorPrimary.cgColor, UIColor.qnYellow.cgColor]
        
        view.layer.addSublayer(gradientLayer)
        view.bringSubviewToFront(tableView)
    }
    
    private func setupTableView() {
        tableView.backgroundColor = .clear
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
            cell.textLabel?.font = .body1()
            cell.textLabel?.textColor = .qnDarkColorAccent
            cell.textLabel?.text = category.toString()
            
            cell.backgroundColor = .clear
            cell.tintColor = .qnOrange
            
            cell.selectionStyle = .none
            cell.accessoryType = CategoriesManager.shared.isSelected(indexPath.row) ? .checkmark : .none
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
