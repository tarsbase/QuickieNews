//
//  NibView.swift
//  QuickieNews
//
//  Created by Nicolas Mulet on 02/06/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import UIKit

class NibView: UIView {
    
    @IBOutlet var view: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        nibSetup()
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        nibSetup()
        
        commonInit()
    }
    
    private func nibSetup() {
        backgroundColor = .clear
        
        view = loadViewFromNib()
        
        if let view = view {
            view.translatesAutoresizingMaskIntoConstraints = false
            
            addSubview(view)
            
            view.topAnchor.constraint(equalTo: topAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            view.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        }
    }
    
    func commonInit() {}
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        
        if let nibView = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            return nibView
        }
        
        return UIView()
    }
}
