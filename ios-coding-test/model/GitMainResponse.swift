//
//  GitMainResponse.swift
//  ios-coding-test
//
//  Created by Mac on 21/01/2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import SwiftyJSON


class GitMainResponse : NSObject, NSCoding{

    var author : GitAuthor!
    var commentsUrl : String!
    var commit : GitCommit!
    var committer : GitCommitter!
    var htmlUrl : String!
    var nodeId : String!
    var parents : [GitParent]!
    var sha : String!
    var url : String!

    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        let authorJson = json["author"]
        if !authorJson.isEmpty{
            author = GitAuthor(fromJson: authorJson)
        }
        commentsUrl = json["comments_url"].stringValue
        let commitJson = json["commit"]
        if !commitJson.isEmpty{
            commit = GitCommit(fromJson: commitJson)
        }
        let committerJson = json["committer"]
        if !committerJson.isEmpty{
            committer = GitCommitter(fromJson: committerJson)
        }
        htmlUrl = json["html_url"].stringValue
        nodeId = json["node_id"].stringValue
        parents = [GitParent]()
        let parentsArray = json["parents"].arrayValue
        for parentsJson in parentsArray{
            let value = GitParent(fromJson: parentsJson)
            parents.append(value)
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
        if author != nil{
            dictionary["author"] = author.toDictionary()
        }
        if commentsUrl != nil{
            dictionary["comments_url"] = commentsUrl
        }
        if commit != nil{
            dictionary["commit"] = commit.toDictionary()
        }
        if committer != nil{
            dictionary["committer"] = committer.toDictionary()
        }
        if htmlUrl != nil{
            dictionary["html_url"] = htmlUrl
        }
        if nodeId != nil{
            dictionary["node_id"] = nodeId
        }
        if parents != nil{
        var dictionaryElements = [[String:Any]]()
        for parentsElement in parents {
            dictionaryElements.append(parentsElement.toDictionary())
        }
        dictionary["parents"] = dictionaryElements
        }
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
        author = aDecoder.decodeObject(forKey: "author") as? GitAuthor
        commentsUrl = aDecoder.decodeObject(forKey: "comments_url") as? String
        commit = aDecoder.decodeObject(forKey: "commit") as? GitCommit
        committer = aDecoder.decodeObject(forKey: "committer") as? GitCommitter
        htmlUrl = aDecoder.decodeObject(forKey: "html_url") as? String
        nodeId = aDecoder.decodeObject(forKey: "node_id") as? String
        parents = aDecoder.decodeObject(forKey: "parents") as? [GitParent]
        sha = aDecoder.decodeObject(forKey: "sha") as? String
        url = aDecoder.decodeObject(forKey: "url") as? String
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
        if commentsUrl != nil{
            aCoder.encode(commentsUrl, forKey: "comments_url")
        }
        if commit != nil{
            aCoder.encode(commit, forKey: "commit")
        }
        if committer != nil{
            aCoder.encode(committer, forKey: "committer")
        }
        if htmlUrl != nil{
            aCoder.encode(htmlUrl, forKey: "html_url")
        }
        if nodeId != nil{
            aCoder.encode(nodeId, forKey: "node_id")
        }
        if parents != nil{
            aCoder.encode(parents, forKey: "parents")
        }
        if sha != nil{
            aCoder.encode(sha, forKey: "sha")
        }
        if url != nil{
            aCoder.encode(url, forKey: "url")
        }

    }

}
