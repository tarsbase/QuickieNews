//
//  ArticleCell.swift
//  QuickieNews
//
//  Created by Nicolas Mulet on 02/06/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import Hero
import SDWebImage
import UIKit

class ArticleCell: UITableViewCell {
    
    @IBOutlet private weak var articleImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
    }
    
    private func setupView() {
        selectionStyle = .none
        
        titleLabel.font = .h4(.bold)
        titleLabel.textColor = .qnYellow
    }
    
    func configure(with article: Article) {
        if let urlToImage = URL(string: article.urlToImage) {
            articleImageView.sd_setImage(with: urlToImage, placeholderImage: R.image.placeholder())
        }
        
        titleLabel.text = article.title
    }
}
