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
        DateFormatter.shared.dateStyle = style
        
        return DateFormatter.shared.string(from: self)
    }
}

extension DateFormatter {
    static var shared: DateFormatter = {
        return DateFormatter()
    }()
}
