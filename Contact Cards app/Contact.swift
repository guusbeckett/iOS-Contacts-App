//
//  Person.swift
//  Track-2-TableViewController
//
//  Created by Diederich Kroeske on 9/3/15.
//  Copyright (c) 2015 Diederich Kroeske. All rights reserved.
//  Edited by Guus Beckett 2015
//

import Foundation
import UIKit

class Contact {
        var gender: Gender?
        var title : String?
        var firstName: String?
        var surname: String?
        var street: String?
        var city: String?
        var state: String?
        var zip: String?
        var email: String?
        var username: String?
        var password: String?
        var registered: String?
        var dob: String?
        var phone: String?
        var imageUrl: String?
        var nationality: String?
        var image: UIImage?
        var md5: String?
    
    
    required init(firstName: String, surname: String, imageUrl : String)
    {
        self.firstName = firstName
        self.surname = surname
        //image = UIImage(named: imageUrl)
        if let url = NSURL(string: imageUrl) {
            if let data = NSData(contentsOfURL: url){
                self.image = UIImage(data: data)
            }
        }
    }
    
    func getDataFromUrl(urL:NSURL, completion: ((data: NSData?) -> Void)) {
        NSURLSession.sharedSession().dataTaskWithURL(urL) { (data, response, error) in
            completion(data: data)
            }.resume()
    }
    
    func downloadImage(url:NSURL){
        getDataFromUrl(url) { data in
            dispatch_async(dispatch_get_main_queue()) {
                self.image = UIImage(data: data!)
            }
        }
    }
    
    func loadImage(){
        if let url = NSURL(string: self.imageUrl!) {    //This should happen async, this is a dirty quick solution
            if let data = NSData(contentsOfURL: url){
                self.image = UIImage(data: data)
            }
        }
//        if let checkedUrl = NSURL(string: self.imageUrl) {    //The async solution
//            downloadImage(checkedUrl)
//        }
    }
    
    init(){}    //ONLY THE GENERATOR SHOULD MAKE NEW PERSON OBJECTS
}
