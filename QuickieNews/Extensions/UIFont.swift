//
//  UIFont.swift
//  QuickieNews
//
//  Created by Nicolas Mulet on 02/06/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import UIKit

// This file groups all our font styles.
// Never use `R.font.yourFont` in other files. If you have to change your font, change it here by using R.
extension UIFont {
    
    enum Style {
        case bold
        case medium
        case regular
        case extraLight
        case extraLightItalic
    }
    
    private static func getFont(with style: Style, with size: CGFloat) -> UIFont {
        switch style {
        case .bold:
            return R.font.montserratBold(size: size) ?? UIFont()
        case .medium:
            return R.font.montserratMedium(size: size) ?? UIFont()
        case .regular:
            return R.font.montserratRegular(size: size) ?? UIFont()
        case .extraLight:
            return R.font.montserratExtraLight(size: size) ?? UIFont()
        case .extraLightItalic:
            return R.font.montserratExtraLightItalic(size: size) ?? UIFont()
        }
    }
    
    static func h0(_ style: Style = .bold) -> UIFont {
        return getFont(with: style, with: 100 / (329 / (UIScreen.main.bounds.width - 88)))
    }
    
    static func h1(_ style: Style = .bold) -> UIFont {
        return getFont(with: style, with: 32.0)
    }
    
    static func h2(_ style: Style = .bold) -> UIFont {
        return getFont(with: style, with: 24.0)
    }
    
    static func h3(_ style: Style = .medium) -> UIFont {
        return getFont(with: style, with: 22.0)
    }
    
    static func h4(_ style: Style = .regular) -> UIFont {
        return getFont(with: style, with: 18.0)
    }
    
    static func body1(_ style: Style = .regular) -> UIFont {
        return getFont(with: style, with: 16.0)
    }
    
    static func body2(_ style: Style = .extraLight) -> UIFont {
        return getFont(with: style, with: 16.0)
    }
    
    static func button(_ style: Style = .bold) -> UIFont {
        return getFont(with: style, with: 14.0)
    }
    
    static func subhead(_ style: Style = .regular) -> UIFont {
        return getFont(with: style, with: 14.0)
    }
    
    static func footnote(_ style: Style = .extraLight) -> UIFont {
        return getFont(with: style, with: 13.0)
    }
    
    static func navigation(_ style: Style = .regular) -> UIFont {
        return getFont(with: style, with: 13.0)
    }
    
    static func caption(_ style: Style = .bold) -> UIFont {
        return getFont(with: style, with: 12.0)
    }
    
    static func overline(_ style: Style = .extraLight) -> UIFont {
        return getFont(with: style, with: 10.0)
    }
}
