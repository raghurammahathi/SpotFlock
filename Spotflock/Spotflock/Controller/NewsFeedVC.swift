//
//  NewsFeedVC.swift
//  Spotflock
//
//  Created by Raghu ram mahathi on 27/07/19.
//  Copyright © 2019 Name. All rights reserved.
//

import UIKit
import Kingfisher
class NewsFeedVC: UIViewController {
    
    var page = 0
    var feed = [FeedData]()

    @IBOutlet weak var tblNewsFeed: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getFeedData()
    }
    


}
extension NewsFeedVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoFeedCell", for: indexPath) as! PhotoFeedCell
        cell.data = feed[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == self.feed.count-1  {
            page = page + 1
            if page > 10{
                print("No feed available")
            }else{
            self.getFeedData()
            }
        }
    }
    func getFeedData() {
        
        FeedData.getNewsFeeds(pageNumber: page, { (feeds) in
            self.feed.append(contentsOf: feeds)
            print(self.feed)
            self.tblNewsFeed.reloadData()
            
        }) { (error) in
            print(error)
        }
    }
}

class PhotoFeedCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblFullDescription: UILabel!
    @IBOutlet var lblLikes: UILabel!
    @IBOutlet var lblComments: UILabel!
    @IBOutlet weak var imgDesciption: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var cellBottomHeight: NSLayoutConstraint!
    @IBOutlet var lblShare: UILabel!
    @IBOutlet var btnLikeUnlike: UIButton!
    @IBOutlet weak var lblUpdatedAt: UILabel!
    @IBOutlet weak var lblCreatedAt: UILabel!
    
    var data: FeedData?{
        didSet {
            if let data = data {
                
                self.lblLikes.text = "\(data.likes ?? 0) Likes"
                self.lblTitle.text = data.title
                self.lblDescription.text = data.shortDescription
                self.lblFullDescription.text = data.fullDescription
                self.lblComments.text = "\(data.comments ?? 0) Comments"
                self.lblShare.text = "\(data.shares ?? 0) shares"
                //self.lblUpdatedAt.text = object.updatedAt
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
                dateFormatter.locale = Locale(identifier: "en_US_POSIX")
                dateFormatter.timeZone = TimeZone.ReferenceType.local
                if let createAt = data.createdAt {
                    let newDateString = createAt + " +0800"
                    let date = dateFormatter.date(from: newDateString)
                    self.lblCreatedAt.text = "Created: \(Date.pcTimeAgoFrom(date!))"
                }
                if let updateAt = data.updatedAt {
                    let newDateString = updateAt + " +0800"
                    let date = dateFormatter.date(from: newDateString)
                    self.lblUpdatedAt.text = "Updated: \(Date.pcTimeAgoFrom(date!))"
                }
                if let image = data.titleImgUrl {
                    imgDesciption.kf.setImage(with: URL(string: image), placeholder: nil, options: [.transition(ImageTransition.fade(1)), .scaleFactor(1.0)], progressBlock: { (receivedSize, totalSize) in
                    }, completionHandler: { (image: Image?, error: NSError?, cacheType, urlImage: URL?) in
                    })
                }
                
                
            }
        }
    }

}
