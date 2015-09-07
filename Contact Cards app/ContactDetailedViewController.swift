//
//  ContactDetailedViewController.swift
//  Contact Cards app
//
//  Created by Guus Beckett on 07/09/15.
//  Copyright (c) 2015 Reupload. All rights reserved.
//

import UIKit

class ContactDetailedViewController: UIViewController{
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var firstNameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var imageImageView: UIImageView!
    @IBOutlet var telephoneNumberLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var streetLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var stateLabel: UILabel!
    @IBOutlet var postcodeLabel: UILabel!
    
    
    var contact : Contact?
    
    override func viewWillAppear(animated: Bool) {
        titleLabel.text = contact?.title
        firstNameLabel.text = contact?.firstName
        surnameLabel.text = contact?.surname
        imageImageView.image = contact?.image
        telephoneNumberLabel.text = contact?.phone
        emailLabel.text = contact?.email
        streetLabel.text = contact?.street
        stateLabel.text = contact?.state
        cityLabel.text = contact?.city
        postcodeLabel.text = contact?.zip
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Circular photo
        imageImageView.layer.cornerRadius = 75
        imageImageView.layer.borderColor = UIColor.darkGrayColor().CGColor
        imageImageView.layer.borderWidth = 2.0
        imageImageView.clipsToBounds = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}