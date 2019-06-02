//
//  ArticleCardView.swift
//  QuickieNews
//
//  Created by Nicolas Mulet on 02/06/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import SDWebImage
import UIKit

class ArticleCardView: NibView {
    
    @IBOutlet private weak var containerView: UIView!
    
    @IBOutlet weak var nopeImageView: UIImageView!
    @IBOutlet weak var nowImageView: UIImageView!
    @IBOutlet weak var laterImageView: UIImageView!
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    
    override func commonInit() {
        super.commonInit()
        
        setupView()
    }
    
    private func setupView() {
        view?.backgroundColor = .clear
        containerView.addRadius()
        containerView.addFixedShadow()
        
        nopeImageView.image = R.image.nope()
        nopeImageView.tintColor = .qnRed
        nopeImageView.alpha = 0.0
        
        nowImageView.image = R.image.now()
        nowImageView.tintColor = .qnColorPrimary
        nowImageView.alpha = 0.0
        
        laterImageView.image = R.image.later()
        laterImageView.tintColor = .qnGreen
        laterImageView.alpha = 0.0
        
        imageView.addRadius()
        
        titleLabel.font = .h4(.bold)
        titleLabel.textColor = .qnYellow
        
        dateLabel.font = .body1()
        dateLabel.textColor = .qnYellow
    }
    
    func configure(with article: Article) {
        if let urlToImage = URL(string: article.urlToImage) {
            imageView.sd_setImage(with: urlToImage, placeholderImage: R.image.placeholder())
        }
        
        titleLabel.text = article.title
        dateLabel.text = R.string.localizable.article_card_date(article.publishedAt.toString())
    }
}
