//
//  ArticleReaderViewController.swift
//  QuickieNews
//
//  Created by Nicolas Mulet on 07/06/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import Hero
import UIKit
import WebKit

class ArticleReaderViewController: UIViewController, WKNavigationDelegate {
    
    private var webView: WKWebView!
    
    private var article: Article?
    
    func initialize(with article: Article) {
        self.article = article
    }
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHero()
        setupWebView()
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
    }
    
    private func setupHero() {
        view.hero.id = HeroId.article + (article?.source.id ?? "")
    }
    
    private func setupWebView() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        if let urlString = article?.url, let url = URL(string: urlString) {
            webView.load(URLRequest(url: url))
            webView.allowsBackForwardNavigationGestures = true
        }
    }
    
    @objc private func handlePan(gestureRecognizer: UIPanGestureRecognizer) {
        switch gestureRecognizer.state {
        case .began:
            navigationController?.popViewController(animated: true)
        case .changed:
            let translation = gestureRecognizer.translation(in: nil)
            let progress = translation.y / 2 / view.bounds.height
            Hero.shared.update(progress)
        default:
            Hero.shared.finish()
        }
    }
}
