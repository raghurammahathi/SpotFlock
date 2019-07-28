//
//  ExtNewsFeed.swift
//  Spotflock
//
//  Created by Raghu ram mahathi on 28/07/19.
//  Copyright © 2019 Name. All rights reserved.
//

import Foundation

extension FeedData {
    
    
    class func getNewsFeeds(pageNumber: Int, _ success:@escaping (_ feed: [FeedData]) -> Void,failed: @escaping (_ errorMessage: String) -> Void){
        
        HTTP.connection(API: "https://gospark.app/api/v1/kstream?page=\(pageNumber)", httpMethod: "GET", { (json) in
            
            if let result = json as? [String: Any]{

                if let stream = result["kstream"] as? [String: Any]{

                    if let data = stream["data"] as? [[String: Any]] {
                        print(data)
                        var feeds = [FeedData]()

                        for dicts in data {
                            let feed = FeedData.init(jsonDict: dicts)
                            feeds.append(feed)
                        }
                        success(feeds)
                    }
                }
            }
            
        }) { (error) in
            failed(error)
        }
        
    }
    
}
