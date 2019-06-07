//
//  TabBarController.swift
//  QuickieNews
//
//  Created by Nicolas Mulet on 31/05/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    private let categoriesViewController = R.storyboard.category.categoriesViewController()
    private let homeNavigationController = R.storyboard.home.homeNavigationController()
    private let articlesNavigationController = R.storyboard.articles.articlesNavigationController()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBar.backgroundColor = .qnWhite
        
        guard let categoriesViewController = categoriesViewController,
            let homeNavigationController = homeNavigationController,
            let articlesNavigationController = articlesNavigationController else {
                return
        }
        
        categoriesViewController.tabBarItem = UITabBarItem(title: R.string.localizable.tabbar_categories(),
                                                           image: R.image.tabbar_category_inactive(),
                                                           selectedImage: R.image.tabbar_category_inactive())
        
        homeNavigationController.setNavigationBarHidden(true, animated: false)
        homeNavigationController.tabBarItem = UITabBarItem(title: R.string.localizable.tabbar_home(),
                                                           image: R.image.tabbar_home_inactive(),
                                                           selectedImage: R.image.tabbar_home_active())
        
        articlesNavigationController.setNavigationBarHidden(false, animated: false)
        articlesNavigationController.tabBarItem = UITabBarItem(title: R.string.localizable.tabbar_articles(),
                                                               image: R.image.tabbar_articles_inactive(),
                                                               selectedImage: R.image.tabbar_articles_inactive())
        
        viewControllers = [categoriesViewController, homeNavigationController, articlesNavigationController]
        
        selectedIndex = 1
    }
}
