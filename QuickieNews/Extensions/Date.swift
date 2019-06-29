//
//  Date.swift
//  QuickieNews
//
//  Created by Nicolas Mulet on 02/06/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import Foundation

extension Date {
    func toString(style: DateFormatter.Style = .long) -> String {
        DateForma.dateFormatter.dateStyle = style
        
        return DateForma.dateFormatter.string(from: self)
    }
}

class DateForma {
    static let dateFormatter = DateFormatter()
}
