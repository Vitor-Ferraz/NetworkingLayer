//
//  ResponseHelper.swift
//  Lodjinha
//
//  Created by Vitor Ferraz on 09/07/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import Foundation
import Alamofire


class ResponseHelper{
    private var request:URLRequest
    
    init(request:URLRequest) {
        self.request = request
    }
    
    @discardableResult
     func performRequest<T:Decodable>(decoder: JSONDecoder = JSONDecoder(), completion:@escaping (ResultHelper<T>)->Void) -> DataRequest {
        return Alamofire.request(request).validate()
            .responseJSONDecodable (decoder: decoder){ (response: DataResponse<T>) in
                dump(response)
                
                DispatchQueue.main.async {
                    switch response.result{
                    case .failure(let error):
                        completion(ResultHelper.error(error))
                    case .success(let value):
                        completion(ResultHelper.success(response.response?.statusCode ?? 404, value))
                    }
                }
        }
    }   
}
