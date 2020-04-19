//
//  PostTableViewCell.swift
//  Finden
//
//  Created by Alan Cao on 4/19/20.
//  Copyright © 2020 Finden. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet var postImage: UIImageView!
    @IBOutlet var postTitle: UILabel!
    @IBOutlet var postDate: UILabel!
    @IBOutlet var postDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
