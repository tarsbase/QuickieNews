//
//  ActionButton.swift
//  QuickieNews
//
//  Created by Nicolas Mulet on 02/06/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import Lottie
import UIKit

class ActionButton: UIButton {
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        
        return CGSize(width: size.width, height: size.height)
    }
    
    private var animationView: LOTAnimationView?
    var isLoading = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    init() {
        super.init(frame: .zero)
        
        commonInit()
    }
    
    func commonInit(with image: UIImage? = nil, and color: UIColor = .qnRed) {
        backgroundColor = .qnLightGrey
        setTitle(nil, for: .normal)
        setImage(image, for: .normal)
        tintColor = color
        addRadius(with: bounds.width / 2.0)
        addFixedShadow()
    }
    
    func startLoading() {
        isLoading = true
        
        setTitle(nil, for: .normal)
        animationView?.isHidden = true
        setImage(nil, for: .normal)
    }
    
    func stopLoading() {
        isLoading = false
        
        animationView?.isHidden = false
    }
    
    func addLottie(_ lottieName: String) {
        animationView = LOTAnimationView(name: lottieName)
        
        if let animationView = animationView {
            animationView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            animationView.contentMode = .scaleAspectFill
            animationView.frame = imageView?.bounds ?? .zero
            animationView.center = imageView?.center ?? .zero
            animationView.loopAnimation = false
            
            addSubview(animationView)
            
            animationView.play()
            imageView?.tintColor = .clear
        }
    }
}
