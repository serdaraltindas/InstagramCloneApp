//
//  FeedCell.swift
//  InstagramCloneApp
//
//  Created by Serdar Altındaş on 26.04.2023.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var commentText: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var emailText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
