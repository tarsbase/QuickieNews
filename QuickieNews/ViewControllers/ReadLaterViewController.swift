//
//  ReadLaterViewController.swift
//  QuickieNews
//
//  Created by Nicolas Mulet on 02/06/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import Hero
import RxCocoa
import RxSwift
import UIKit

class ReadLaterViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNagivationBar()
        setupView()
        setupTableView()
        setupListeners()
    }
    
    private func setupNagivationBar() {
        title = R.string.localizable.read_later_title()
        navigationController?.hero.isEnabled = true
        navigationController?.hero.navigationAnimationType = .zoom
        navigationItem.rightBarButtonItem?.title = ArticlesManager.shared.orderedBy.toString()
    }
    
    private func setupView() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.qnColorPrimary.cgColor, UIColor.qnOrange.cgColor]
        
        view.layer.addSublayer(gradientLayer)
        view.bringSubviewToFront(tableView)
    }
    
    private func setupTableView() {
        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.delegate = self
        
        ArticleCell.registerNibWith(tableView)
    }
    
    private func setupListeners() {
        ArticlesManager.shared.rxReadLaterArticles.subscribe { _ in
            self.tableView.reloadData()
        }.disposed(by: disposeBag)
    }
}

// MARK: - UITableViewDataSource

extension ReadLaterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArticlesManager.shared.readLaterArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.reuseIdentifier(), for: indexPath) as? ArticleCell {
            if ArticlesManager.shared.readLaterArticles.indices.contains(indexPath.row) {
                cell.configure(with: ArticlesManager.shared.readLaterArticles[indexPath.row])
            }
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete, ArticlesManager.shared.readLaterArticles.indices.contains(indexPath.row) {
            ArticlesManager.shared.readLaterArticles.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            ArticlesManager.shared.saveReadLaterArticlesToCache()
        }
    }
}

// MARK: - UITableViewDelegate

extension ReadLaterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if ArticlesManager.shared.readLaterArticles.indices.contains(indexPath.row) {
            if let articleReaderVC = R.storyboard.articles.articleReaderViewController() {
                articleReaderVC.initialize(with: ArticlesManager.shared.readLaterArticles[indexPath.row])
                
                navigationController?.pushViewController(articleReaderVC, animated: true)
            }
        }
    }
}

// MARK: - Action handlers

extension ReadLaterViewController {
    @IBAction private func orderingButtonTapped(_ sender: Any) {
        ArticlesManager.shared.reorderLaterArticles()
        navigationItem.rightBarButtonItem?.title = ArticlesManager.shared.orderedBy.toString()
    }
}
