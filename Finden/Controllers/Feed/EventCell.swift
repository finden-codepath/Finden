//
//  EventCell.swift
//  Finden
//
//  Created by 김송은 on 4/24/20.
//  Copyright © 2020 Finden. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var eventnameLabel: UILabel!
    @IBOutlet weak var eventdateLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        eventImageView.layer.cornerRadius = 150 / 16
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
