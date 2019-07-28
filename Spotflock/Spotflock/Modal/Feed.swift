//
//  Feed.swift
//  Spotflock
//
//  Created by Raghu ram mahathi on 27/07/19.
//  Copyright © 2019 Name. All rights reserved.
//

import Foundation

class FeedData {
    
    var postId: Int16?
    var rssSourceId: Int16?
    var title: String?
    var titleImg: String?
    var tagLine: String?
    var shortDescription: String?
    var fullDescription: String?
    var titleImgUrl: String?
    var descriptionImgUrl: String?
    var articleUrl: String?
    var author: String?
    var articleType: String?
    var publishedDate: String?
    var isSponsered: Bool?
    var isPremium: Bool?
    var tags: String?
    var filterTags: String?
    var likes: Int16?
    var comments: Int16?
    var shares: Int16?
    var metaKstreamId: Int16?
    var accepted: Bool?
    var createdAt: String?
    var updatedAt: String?

    
    
    init(jsonDict: [String: Any]) {
        
        
        self.postId = jsonDict["id"] as? Int16
        self.rssSourceId = jsonDict["rss_source_id"] as? Int16
        self.title = jsonDict["title"] as? String
        self.titleImg = jsonDict["title_image"] as? String
        self.tagLine = jsonDict["tag_line"] as? String
        self.shortDescription = jsonDict["short_description"] as? String
        self.fullDescription = jsonDict["full_description"] as? String
        self.titleImgUrl = jsonDict["title_image_url"] as? String
        self.descriptionImgUrl = jsonDict["description_image_url"] as? String
        self.articleUrl = jsonDict["article_url"] as? String
        self.author = jsonDict["author"] as? String
        self.articleType = jsonDict["article_type"] as? String
        self.publishedDate = jsonDict["published_date"] as? String
        self.isSponsered = jsonDict["is_sponsored"] as? Bool
        self.isPremium = jsonDict["is_premium"] as? Bool
        self.tags = jsonDict["tags"] as? String
        self.filterTags = jsonDict["filtertags"] as? String
        self.likes = jsonDict["likes"] as? Int16
        self.comments = jsonDict["comments"] as? Int16
        self.shares = jsonDict["shares"] as? Int16
        self.metaKstreamId = jsonDict["meta_kstream_id"] as? Int16
        self.accepted = jsonDict["accepted"] as? Bool
        self.createdAt = jsonDict["created_at"] as? String
        self.updatedAt = jsonDict["updated_at"] as? String
  
    }
    
}
