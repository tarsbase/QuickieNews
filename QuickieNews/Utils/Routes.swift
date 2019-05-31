//
//  Routes.swift
//  QuickieNews
//
//  Created by Nicolas Mulet on 31/05/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import Foundation

enum Routes {
    case topHeadlines
}

extension Routes: RoutePath {
    var path: String {
        switch self {
        case .topHeadlines:
            return "/top-headlines"
        }
    }
}
