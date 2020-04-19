//
//  FeedTableViewController.swift
//  Finden
//
//  Created by Alan Cao on 4/19/20.
//  Copyright © 2020 Finden. All rights reserved.
//

import UIKit
import AlamofireImage
import Parse

class FeedTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var posts = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.rowHeight = 200
        
        let query = PFQuery(className: "Posts")
        query.includeKeys(["eventDate", "description", "location", "image"])
        query.findObjectsInBackground { (posts, error) in
            if posts != nil {
                self.posts = posts!
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        let imageFile = post["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
                
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableViewCell
        cell.postTitle.text = post["title"] as? String
        cell.postDate.text = post["eventDate"] as? String
        cell.postDescription.text = post["description"] as? String
        cell.postImage.af_setImage(withURL: url)
        cell.postImage.layer.cornerRadius = 10
            
        return cell
    }
}
