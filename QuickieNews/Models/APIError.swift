//
//  APIError.swift
//  QuickieNews
//
//  Created by Nicolas Mulet on 31/05/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import SwiftyJSON

struct APIError {
    var code: Int?
    var message: String?
    
    var formattedMessage: String {
        if let message = message, !message.isEmpty {
            return message
        }
        
        return R.string.localizable.internal_error_no_code()
    }
    
    init(message: String) {
        self.message = message
    }
    
    init(code: Int?, message: String) {
        self.code = code
        self.message = message
    }
    
    init?(json: JSON) {
        let code = json["response_code"].int
        let message = json["message"].stringValue
        
        self.init(code: code, message: message)
    }
}
