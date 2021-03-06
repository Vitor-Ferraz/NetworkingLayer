//
//  NetworkManager.swift
//  Lodjinha
//
//  Created by Vitor Ferraz on 09/07/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import Foundation
import Alamofire


class NetworkManager {
    
    let url:URL
    let method : String
    var parameters : [String:String]    = [:]
    var headers : [String:String]       = [:]
    
    fileprivate var request : URLRequest
    {
        var fieldParams:[String] = []
        var urlRequest = URLRequest(url: self.url)
        urlRequest.httpMethod = method
        
        for (key,value) in headers {
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }
        
        for (key,value) in parameters {
            let paramValue = "\(key)=\(value)"
            fieldParams.append(paramValue)
        }
        
        let paramsString = fieldParams.joined(separator: "&")
        urlRequest.httpBody = paramsString.data(using:.utf8)
        return urlRequest
    }
    
    init(url:String, methodName:String) {
        self.url = URL(string:url)!
        self.method = methodName
    }
    
    convenience  init(url:String, method:HTTPMethod) {
        self.init(url:url, methodName:method.rawValue)
    }
    
    func header(_ fields:[String:String]) {
        self.headers = fields
    }
    
    func addHeader(_ key:String, value:String) -> NetworkManager {
        self.headers[key] = value
        return self
    }
    
    func parameters(_ fields:[String:String]) {
        self.headers = fields
    }
    
    func addParameter(_ key:String, value:String) -> NetworkManager {
        self.parameters[key] = value
        return self
    }
    
}

extension NetworkManager
{
    func response<T:Decodable>(completion:@escaping (ResultHelper<T>) -> Void) {
        let requestEntity = self.request
        let responseEntity = ResponseHelper(request: requestEntity)
        responseEntity.performRequest(completion: completion)
    }
}
