//
//  GitCommit.swift
//  ios-coding-test
//
//  Created by Mac on 21/01/2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import SwiftyJSON


class GitCommit : NSObject, NSCoding{

    var author : GitAuthorData!
    var commentCount : Int!
    var committer : GitSubCommitter!
    var message : String!
    var tree : GitTree!
    var url : String!
    var verification : GitVerification!

    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        let authorJson = json["author"]
        if !authorJson.isEmpty{
            author = GitAuthorData(fromJson: authorJson)
        }
        commentCount = json["comment_count"].intValue
        let committerJson = json["committer"]
        if !committerJson.isEmpty{
            committer = GitSubCommitter(fromJson: committerJson)
        }
        message = json["message"].stringValue
        let treeJson = json["tree"]
        if !treeJson.isEmpty{
            tree = GitTree(fromJson: treeJson)
        }
        url = json["url"].stringValue
        let verificationJson = json["verification"]
        if !verificationJson.isEmpty{
            verification = GitVerification(fromJson: verificationJson)
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if author != nil{
            dictionary["author"] = author.toDictionary()
        }
        if commentCount != nil{
            dictionary["comment_count"] = commentCount
        }
        if committer != nil{
            dictionary["committer"] = committer.toDictionary()
        }
        if message != nil{
            dictionary["message"] = message
        }
        if tree != nil{
            dictionary["tree"] = tree.toDictionary()
        }
        if url != nil{
            dictionary["url"] = url
        }
        if verification != nil{
            dictionary["verification"] = verification.toDictionary()
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
        author = aDecoder.decodeObject(forKey: "author") as? GitAuthorData
        commentCount = aDecoder.decodeObject(forKey: "comment_count") as? Int
        committer = aDecoder.decodeObject(forKey: "committer") as? GitSubCommitter
        message = aDecoder.decodeObject(forKey: "message") as? String
        tree = aDecoder.decodeObject(forKey: "tree") as? GitTree
        url = aDecoder.decodeObject(forKey: "url") as? String
        verification = aDecoder.decodeObject(forKey: "verification") as? GitVerification
    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
    {
        if author != nil{
            aCoder.encode(author, forKey: "author")
        }
        if commentCount != nil{
            aCoder.encode(commentCount, forKey: "comment_count")
        }
        if committer != nil{
            aCoder.encode(committer, forKey: "committer")
        }
        if message != nil{
            aCoder.encode(message, forKey: "message")
        }
        if tree != nil{
            aCoder.encode(tree, forKey: "tree")
        }
        if url != nil{
            aCoder.encode(url, forKey: "url")
        }
        if verification != nil{
            aCoder.encode(verification, forKey: "verification")
        }

    }

}
