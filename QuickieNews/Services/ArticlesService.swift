//
//  ArticlesService.swift
//  QuickieNews
//
//  Created by Nicolas Mulet on 31/05/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import Foundation
import SwiftyJSON

class ArticlesService: APIService {
    func getArticles(from category: String, completion: @escaping(APIStatus, APIError?, [Article]) -> Void) {
        let url = urlForEndpoint(Routes.topHeadlines.path)
        
        sendRequest(.get, url: url, parameters: nil) { (response, error) in
            if let response = response, error == nil {
                let json = JSON(response)
                let articles = json["articles"].arrayValue.compactMap({ Article(json: $0) })
                
                completion(.success, nil, articles)
            } else {
                completion(.failure, error, [])
            }
        }
    }
}
