//
//  UIColor.swift
//  QuickieNews
//
//  Created by Nicolas Mulet on 01/06/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import Foundation
import UIKit

// This file groups all our colors.
// Never use any other color. If you have to add or change a color, change it here by using its hexadecimal representation.
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    
    convenience init(netHex: Int, alpha: CGFloat = 1.0) {
        self.init(red: (netHex >> 16) & 0xFF, green: (netHex >> 8) & 0xFF, blue: netHex & 0xFF, alpha: alpha)
    }
}

extension UIColor {
    class var qnColorPrimary: UIColor {
        return UIColor(netHex: 0x37A2C4)
    }
    
    class var qnRed: UIColor {
        return UIColor(netHex: 0xF48070)
    }
    
    class var qnYellow: UIColor {
        return UIColor(netHex: 0xFDF18D)
    }
    
    class var qnGreen: UIColor {
        return UIColor(netHex: 0x70CD9A)
    }
    
    class var qnOrange: UIColor {
        return UIColor(netHex: 0xFFA448)
    }
    
    class var qnDarkBlue: UIColor {
        return UIColor(netHex: 0x4A737F)
    }
    
    class var qnDarkColorAccent: UIColor {
        return UIColor(netHex: 0x26303C)
    }
    
    class var qnPurple: UIColor {
        return UIColor(netHex: 0x730BF0)
    }
    
    class var qnWhite: UIColor {
        return UIColor(netHex: 0xFFFFFF)
    }
    
    class var qnGrey: UIColor {
        return UIColor(netHex: 0x96A0B4)
    }
    
    class var qnLightGrey: UIColor {
        return UIColor(netHex: 0xF0F3F7)
    }
    
    class var qnGreyDark: UIColor {
        return UIColor(netHex: 0x5F6878)
    }
    
    class var qnLightGreyBlue: UIColor {
        return UIColor(netHex: 0xDAE2ED)
    }
    
    class var qnVeryDarkBlue: UIColor {
        return UIColor(netHex: 0x123540)
    }
    
    class var qnColorBackground: UIColor {
        return UIColor(netHex: 0xF2F3F5)
    }
    
    class var qnColorOverlay: UIColor {
        return UIColor(netHex: 0x5F6878, alpha: 0.5)
    }
    
    class var qnTransparant: UIColor {
        return UIColor(netHex: 0x000000, alpha: 0.5)
    }
    
    class var qnTranslucentWhite: UIColor {
        return UIColor(netHex: 0xFFFFFF, alpha: 0.7)
    }
}
