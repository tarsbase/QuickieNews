//
//  ArticleCardView.swift
//  QuickieNews
//
//  Created by Nicolas Mulet on 02/06/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import QuartzCore
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
    
    var article: Article?
    
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
        
        imageView.isUserInteractionEnabled = true
        imageView.addRadius()
        
        titleLabel.font = .h4(.bold)
        titleLabel.textColor = .qnYellow
        titleLabel.backgroundColor = .qnTransparant
        titleLabel.layer.masksToBounds = true
        titleLabel.layer.cornerRadius = 6.0
        
        dateLabel.font = .body1()
        dateLabel.textColor = .qnYellow
        dateLabel.backgroundColor = .qnTransparant
        dateLabel.layer.masksToBounds = true
        dateLabel.layer.cornerRadius = 6.0
    }
    
    func configure(with article: Article) {
        self.article = article
        
        if let urlToImage = URL(string: article.urlToImage) {
            imageView.sd_setImage(with: urlToImage, placeholderImage: R.image.placeholder())
        } else {
            imageView.image = R.image.placeholder()
        }
        
        titleLabel.text = article.title
        dateLabel.text = R.string.localizable.article_card_date(article.publishedAt.toString())
    }
}
