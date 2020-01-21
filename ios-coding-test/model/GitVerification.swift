//
//  GitVerification.swift
//  ios-coding-test
//
//  Created by Mac on 21/01/2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import SwiftyJSON


class GitVerification : NSObject, NSCoding{

    var payload : String!
    var reason : String!
    var signature : String!
    var verified : Bool!

    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        payload = json["payload"].stringValue
        reason = json["reason"].stringValue
        signature = json["signature"].stringValue
        verified = json["verified"].boolValue
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if payload != nil{
            dictionary["payload"] = payload
        }
        if reason != nil{
            dictionary["reason"] = reason
        }
        if signature != nil{
            dictionary["signature"] = signature
        }
        if verified != nil{
            dictionary["verified"] = verified
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
        payload = aDecoder.decodeObject(forKey: "payload") as? String
        reason = aDecoder.decodeObject(forKey: "reason") as? String
        signature = aDecoder.decodeObject(forKey: "signature") as? String
        verified = aDecoder.decodeObject(forKey: "verified") as? Bool
    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
    {
        if payload != nil{
            aCoder.encode(payload, forKey: "payload")
        }
        if reason != nil{
            aCoder.encode(reason, forKey: "reason")
        }
        if signature != nil{
            aCoder.encode(signature, forKey: "signature")
        }
        if verified != nil{
            aCoder.encode(verified, forKey: "verified")
        }

    }

}
