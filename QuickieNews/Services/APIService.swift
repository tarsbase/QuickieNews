//
//  APIService.swift
//  QuickieNews
//
//  Created by Nicolas Mulet on 31/05/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import Alamofire
import SwiftyJSON

enum APIStatus {
    case success
    case failure
}

class APIService {
    /// The default HTTP header.
    private var defaultHeaders = ["Content-Type": "application/json"]
    
    private let newsAPIUrl = "https://newsapi.org/v2"
    private let newsAPIKey = "48df37d4832d44e9bf6a9eb967df4500"
    
    func urlForEndpoint(_ endpoint: String) -> String {
        let urlString = newsAPIUrl + endpoint + "?country=us&apiKey=\(newsAPIKey)"
        
        return urlString
    }
    
    private func showRequestLog(_ method: HTTPMethod, _ url: String, _ parameters: [String: Any]?, _ header: [String: String]) {
        let reqString = method.rawValue + " " + url
        
        let line = String(repeating: "=", count: reqString.count)
        print(line)
        print(reqString)
        print("")
        print(header)
        if let parameters = parameters {
            print("")
            print(parameters)
        }
        print(line)
        print("")
        print("waiting for response...")
    }
    
    private func showResponseLog(_ response: DataResponse<Any>) {
        let line = String(repeating: "=", count: 10)
        print("")
        print(line)
        print("")
        if let data = response.data, let message = String(data: data, encoding: String.Encoding.utf8) {
            print(message)
            print("")
            print(response.response?.statusCode ?? "")
        } else {
            print("NOTHING")
        }
        print("")
        print(line)
        print("")
    }
    
    /// Sends a request to the backend with the given parameters. All the diacritic are removed from the url.
    ///
    /// - Parameter method: The HTTP method
    /// - Parameter url: The url
    /// - Parameter parameters: The HTTP body
    /// - Parameter canAuth: True if the user is logged
    /// - Parameter encoding: The encoding method for the JSON
    /// - Parameter completion: The package returns by the backend
    func sendRequest(_ method: HTTPMethod, url: String, parameters: [String: Any]?, encoding: ParameterEncoding = JSONEncoding.default, completion: @escaping (Any?, _ error: APIError?) -> Void) {
        let cleanUrl = url.folding(options: .diacriticInsensitive, locale: .current)
        let headers = defaultHeaders
        
        #if DEBUG
        showRequestLog(method, cleanUrl, parameters, headers)
        #endif
        
        let request = Alamofire.request(cleanUrl, method: method, parameters: parameters, encoding: encoding, headers: headers).validate()
        
        request.responseJSON { (response) in
            #if DEBUG
            self.showResponseLog(response)
            #endif
            
            // Error management
            var error: APIError?
            
            if response.result.isFailure {
                error = self.mapAPIError(response.data)
            }
            
            completion(response.result.value, error)
        }
    }
    
    /// Takes care of mapping the received error
    ///
    /// - Parameter error: the error as Data
    /// - Returns: an APIError object corresponding to the `error`
    func mapAPIError(_ error: Data?) -> APIError? {
        if let errorData = error {
            if let errorJSON = try? JSON(data: errorData), let apiError = APIError(json: errorJSON) {
                return apiError
            }
        }
        
        return nil
    }
}
