//
//  HomeViewController.swift
//  QuickieNews
//
//  Created by Nicolas Mulet on 31/05/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import Hero
import RxCocoa
import RxSwift
import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var noCategoryLabel: UILabel!
    
    @IBOutlet private weak var cardsMainView: UIView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet private weak var nopeButton: ActionButton!
    @IBOutlet private weak var laterButton: ActionButton!
    @IBOutlet private weak var nowButton: ActionButton!
    
    private let disposeBag = DisposeBag()
    
    private var currentArticleIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNagivationBar()
        setupView()
        setupButtons()
        setupCards()
        setupListeners()
    }
    
    private func setupNagivationBar() {
        title = R.string.localizable.home_title()
        navigationController?.hero.isEnabled = true
        navigationController?.hero.navigationAnimationType = .fade
    }
    
    private func setupView() {
        noCategoryLabel.font = .h4()
        noCategoryLabel.textColor = .qnGrey
        noCategoryLabel.text = R.string.localizable.home_no_category()
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
        if CategoriesManager.shared.selectedCategories.isEmpty {
            noCategoryLabel.isHidden = false
            cardsMainView.isHidden = true
        } else {
            noCategoryLabel.isHidden = true
            cardsMainView.isHidden = false
            cardsMainView.subviews.forEach({ $0.removeFromSuperview() })
            activityIndicator.startAnimating()
            
            ArticlesManager.shared.getAllArticles(from: CategoriesManager.shared.selectedCategories) { articles in
                self.activityIndicator.stopAnimating()
                
                for (index, article) in articles.enumerated() {
                    self.currentArticleIndex = index
                    guard index < 2 else {
                        // Add the only two first articles in display
                        return
                    }
                    
                    let articleCardView = ArticleCardView()
                    articleCardView.configure(with: article)
                    articleCardView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.panCard)))
                    
                    self.cardsMainView.addSubview(articleCardView)
                    articleCardView.bounds = self.cardsMainView.frame
                    articleCardView.center = self.cardsMainView.center
                    ArticlesManager.shared.currentArticles.remove(at: self.currentArticleIndex)
                }
            }
        }
    }
    
    private func setupListeners() {
        CategoriesManager.shared.rxSelectedCategories.subscribe { _ in
            self.setupCards()
        }.disposed(by: disposeBag)
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
            if deltaToCenter.x < -.deltaWidth {
                self = .left
            } else if deltaToCenter.x > .deltaWidth {
                self = .right
            } else if deltaToCenter.y < -.deltaHeight {
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
            
            card.transform = CGAffineTransform(rotationAngle: .rotationAngle * (deltaToCenter.x / .rotationAngleLimit))
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
                card.transform = CGAffineTransform(rotationAngle: -.rotationAngle)
            }
        }, completion: { _ in
            if let card = self.cardsMainView.subviews.last as? ArticleCardView {
                card.removeFromSuperview()
                self.nextCard()
            }
        })
    }
    
    private func laterAction() {
        UIView.animate(withDuration: 0.4, animations: {
            if let card = self.cardsMainView.subviews.last as? ArticleCardView {
                card.center = CGPoint(x: 2.0 * UIScreen.main.bounds.width, y: self.cardsMainView.center.y)
                card.transform = CGAffineTransform(rotationAngle: .rotationAngle)
            }
        }, completion: { _ in
            if let card = self.cardsMainView.subviews.last as? ArticleCardView {
                card.removeFromSuperview()
                if let article = card.article {
                    ArticlesManager.shared.addToReadLaterArticles(article)
                    self.nextCard()
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
                self.nextCard()
                
                if let article = card.article, let articleReaderVC = R.storyboard.articles.articleReaderViewController() {
                    articleReaderVC.initialize(with: article)
                    
                    self.navigationController?.pushViewController(articleReaderVC, animated: true)
                }
            }
        })
    }
    
    private func nextCard() {
        currentArticleIndex += 1
        guard ArticlesManager.shared.currentArticles.indices.contains(currentArticleIndex) else {
            return
        }
        
        let articleCardView = ArticleCardView()
        articleCardView.configure(with: ArticlesManager.shared.currentArticles[currentArticleIndex])
        articleCardView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panCard)))
        articleCardView.isHidden = true
        
        self.cardsMainView.addSubview(articleCardView)
        self.cardsMainView.sendSubviewToBack(articleCardView)
        articleCardView.bounds = cardsMainView.frame
        articleCardView.center = cardsMainView.center
        articleCardView.isHidden = false
        
        ArticlesManager.shared.currentArticles.remove(at: currentArticleIndex)
    }
}
