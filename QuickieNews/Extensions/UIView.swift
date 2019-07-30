//
//  UIView.swift
//  QuickieNews
//
//  Created by Nicolas Mulet on 02/06/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import UIKit

extension UIView {
    func addShadow(with color: UIColor = .qnGreyDark, and offset: CGSize = CGSize(width: 0.0, height: 2.0)) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = offset
        layer.shadowRadius = 4.0
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        
        layer.rasterizationScale = UIScreen.main.scale
    }
    
    func addFixedShadow() {
        layer.shadowColor = UIColor.qnGreyDark.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 4.0
        layer.masksToBounds = false
    }
    
    func addRadius(with radius: CGFloat = 6.0) {
        layer.cornerRadius = radius
        layer.borderColor = UIColor.clear.cgColor
        layer.borderWidth = 1.0
    }
    
    func addBorder(with color: UIColor = .qnDarkColorAccent) {
        layer.borderWidth = 1.0
        layer.cornerRadius = 3.0
        layer.borderColor = color.cgColor
    }
}
