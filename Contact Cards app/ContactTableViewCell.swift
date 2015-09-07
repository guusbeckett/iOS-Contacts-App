//
//  ContactTableViewCell.swift
//  Contact Cards app
//
//  Created by Guus Beckett on 07/09/15.
//  Copyright (c) 2015 Reupload. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    @IBOutlet var contactImage: UIImageView!
    @IBOutlet var contactFirstName: UILabel!
    @IBOutlet var contactSurname: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        contactImage.layer.cornerRadius = 55
        contactImage.layer.borderColor = UIColor.darkGrayColor().CGColor
        contactImage.layer.borderWidth = 2.0
        contactImage.clipsToBounds = true
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
