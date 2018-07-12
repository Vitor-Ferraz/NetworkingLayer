//
//  RestManager.swift
//  Lodjinha
//
//  Created by Vitor Ferraz on 09/07/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import Foundation
import Alamofire


class RestManager {
    
    fileprivate init() {}
    
    static  func get(_ url:String) -> NetworkManager {
        let request = NetworkManager(url: url, method:HTTPMethod.get)
        return request
    }
    
    static  func post(_ url:String) -> NetworkManager {
        let request = NetworkManager(url: url, method:HTTPMethod.post)
        return request
    }
    
    static  func put(_ url:String) -> NetworkManager {
        let request = NetworkManager(url: url, method:HTTPMethod.put)
        return request
    }
    
    static  func delete(_ url:String) -> NetworkManager {
        let request = NetworkManager(url: url, method:HTTPMethod.delete)
        return request
    }
    
    static  func patch(_ url:String) -> NetworkManager {
        let request = NetworkManager(url: url, method:HTTPMethod.patch)
        return request
    }
}
