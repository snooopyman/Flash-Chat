//
//  MessageCell.swift
//  Flash Chat iOS13
//
//  Created by Armando Cáceres on 19/5/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

//Class for design our MessageCell.XIB
class MessageCell: UITableViewCell {
    
    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    
    //Call when we create a new cell from MessageCell.xib
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
