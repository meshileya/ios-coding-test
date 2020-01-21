//
//  GitTree.swift
//  ios-coding-test
//
//  Created by Mac on 21/01/2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import SwiftyJSON


class GitTree : NSObject, NSCoding{

    var sha : String!
    var url : String!

    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        sha = json["sha"].stringValue
        url = json["url"].stringValue
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if sha != nil{
            dictionary["sha"] = sha
        }
        if url != nil{
            dictionary["url"] = url
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
        sha = aDecoder.decodeObject(forKey: "sha") as? String
        url = aDecoder.decodeObject(forKey: "url") as? String
    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
    {
        if sha != nil{
            aCoder.encode(sha, forKey: "sha")
        }
        if url != nil{
            aCoder.encode(url, forKey: "url")
        }

    }

}
