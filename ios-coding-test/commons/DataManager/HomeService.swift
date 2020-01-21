//
//  HomeService.swift
//  ios-coding-test
//
//  Created by Mac on 21/01/2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class HomeService{
    typealias CompletionHandlerSwiftyJson = (_ result: Bool, _ data: JSON, _ error: Error?) -> Void
    
    func makeOTPCheckCall(handler: @escaping CompletionHandlerSwiftyJson){
        Alamofire.request(API.baseUrl+"rails/rails/commits?per_page=50&sha=81d828a14c82b882e31612431a56f830bdc1076f", method: .get, parameters: nil,encoding: JSONEncoding.default, headers : nil).responseJSON
            {
                response in
                print(response)
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    print(json)
                    handler(true,json, nil)
                case .failure(let error):
                    handler(false,[:], error)
                }
        }
    }
}
