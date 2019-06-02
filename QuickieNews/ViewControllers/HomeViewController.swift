//
//  HomeViewController.swift
//  QuickieNews
//
//  Created by Nicolas Mulet on 31/05/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var cardsMainView: UIView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet private weak var nopeButton: ActionButton!
    @IBOutlet private weak var laterButton: ActionButton!
    @IBOutlet private weak var nowButton: ActionButton!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtons()
        setupCards()
        setupListeners()
    }
    
    private func setupButtons() {
        nopeButton.addTarget(self, action: #selector(nopeButtonTapped), for: .touchUpInside)
        nopeButton.commonInit(with: R.image.nope(), and: .qnRed)
        
        laterButton.addTarget(self, action: #selector(laterButtonTapped), for: .touchUpInside)
        laterButton.commonInit(with: R.image.later(), and: .qnGreen)
        
        nowButton.addTarget(self, action: #selector(nowButtonTapped), for: .touchUpInside)
        nowButton.commonInit(with: R.image.now(), and: .qnColorPrimary)
    }
    
    private func setupCards() {
        activityIndicator.startAnimating()
        
        ArticlesManager.shared.getAllArticles(from: ["Sports"]/*CategoriesManager.shared.selectedCategories*/) { articles in
            self.activityIndicator.stopAnimating()
            
            for article in articles {
                let articleCardView = ArticleCardView()
                articleCardView.configure(with: article)
                articleCardView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.panCard)))
                
                self.cardsMainView.addSubview(articleCardView)
                articleCardView.bounds = self.cardsMainView.frame
                articleCardView.center = self.cardsMainView.center
            }
        }
    }
    
    private func setupListeners() {
        
    }
}

// MARK: - Buttons handlers

extension HomeViewController {
    @objc private func nopeButtonTapped() {
        nopeAction()
    }
    
    @objc private func laterButtonTapped() {
        laterAction()
    }
    
    @objc private func nowButtonTapped() {
        nowAction()
    }
}

// MARK: - Cards handler

extension HomeViewController {
    enum CardPlacement {
        init(deltaToCenter: CGPoint) {
            if deltaToCenter.x < -(UIScreen.main.bounds.width / 5.0) {
                self = .left
            } else if deltaToCenter.x > (UIScreen.main.bounds.width / 5.0) {
                self = .right
            } else if deltaToCenter.y < -(UIScreen.main.bounds.height / 5.0) {
                self = .top
            } else {
                self = .center
            }
        }
        
        case left
        case center
        case right
        case top
    }
    
    @objc private func panCard(_ sender: UIPanGestureRecognizer) {
        if let card = sender.view as? ArticleCardView {
            let translation = sender.translation(in: card)
            
            let deltaToCenter = card.center - cardsMainView.center
            let cardPlacement = CardPlacement(deltaToCenter: deltaToCenter)
            
            card.transform = CGAffineTransform(rotationAngle: (.pi / 4.0) * (deltaToCenter.x / cardsMainView.center.x))
            if abs(deltaToCenter.y) > (UIScreen.main.bounds.height / 10.0) {
                card.nowImageView.alpha = 3.0 * abs(deltaToCenter.y) / cardsMainView.center.y
                card.laterImageView.alpha = 0.0
                card.nopeImageView.alpha = 0.0
            } else {
                card.nowImageView.alpha = 0.0
                
                if deltaToCenter.x < 0 {
                    card.nopeImageView.alpha = 5.0 * abs(deltaToCenter.x) / cardsMainView.center.x
                    card.laterImageView.alpha = 0.0
                } else {
                    card.laterImageView.alpha = 5.0 * abs(deltaToCenter.x) / cardsMainView.center.x
                    card.nopeImageView.alpha = 0.0
                }
            }
            
            switch sender.state {
            case .began, .changed:
                card.center = CGPoint(x: cardsMainView.center.x + translation.x, y: cardsMainView.center.y + translation.y)
            case .cancelled, .failed, .ended, .possible:
                UIView.animate(withDuration: 0.2) {
                    switch cardPlacement {
                    case .center:
                        card.center = self.cardsMainView.center
                        card.transform = .identity
                        
                        card.nopeImageView.alpha = 0.0
                        card.laterImageView.alpha = 0.0
                        card.nowImageView.alpha = 0.0
                    case .top:
                        self.nowAction()
                    case .left:
                        self.nopeAction()
                    case .right:
                        self.laterAction()
                    }
                }
            @unknown default:
                fatalError()
            }
        }
    }
    
    private func nopeAction() {
        UIView.animate(withDuration: 0.4, animations: {
            if let card = self.cardsMainView.subviews.last as? ArticleCardView {
                card.center = CGPoint(x: -2.0 * UIScreen.main.bounds.width, y: self.cardsMainView.center.y)
                card.transform = CGAffineTransform(rotationAngle: -.pi / 4.0)
            }
        }, completion: { _ in
            if let card = self.cardsMainView.subviews.last as? ArticleCardView {
                card.removeFromSuperview()
            }
        })
    }
    
    private func laterAction() {
        UIView.animate(withDuration: 0.4, animations: {
            if let card = self.cardsMainView.subviews.last as? ArticleCardView {
                card.center = CGPoint(x: 2.0 * UIScreen.main.bounds.width, y: self.cardsMainView.center.y)
                card.transform = CGAffineTransform(rotationAngle: .pi / 4.0)
            }
        }, completion: { _ in
            if let card = self.cardsMainView.subviews.last as? ArticleCardView {
                card.removeFromSuperview()
                if let article = ArticlesManager.shared.currentArticles.last {
                    ArticlesManager.shared.addToReadLaterArticles(article)
                    ArticlesManager.shared.currentArticles.removeLast()
                }
            }
        })
    }
    
    private func nowAction() {
        UIView.animate(withDuration: 0.4, animations: {
            if let card = self.cardsMainView.subviews.last as? ArticleCardView {
                card.center = CGPoint(x: self.cardsMainView.center.x, y: -2.0 * UIScreen.main.bounds.height)
            }
        }, completion: { _ in
            if let card = self.cardsMainView.subviews.last as? ArticleCardView {
                card.removeFromSuperview()
            }
        })
    }
}
