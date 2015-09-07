//
//  PersonsGenerator.swift
//  Track-2-Persons-PList
//
//  Created by Diederich Kroeske on 9/6/15.
//  Copyright (c) 2015 Diederich Kroeske. All rights reserved.
//  Edited by Guus Beckett
//

import UIKit

enum Gender {
    case male
    case female
    case other
}

class ContactGenerator: NSObject {
    
    // Constructor
    required override init()
    {
        super.init()
    }
    
    //
    // Return random person
    //
    func generate() -> Contact {
        
        let person = Contact()
        
        let path = NSBundle.mainBundle().pathForResource("persons", ofType: "plist");
        let persons = NSDictionary(contentsOfFile: path!)
        
        if let items : NSArray = persons!.objectForKey("persons") as? NSArray {
            // pick random user uit lijst
            let count = items.count
            let randomIndex : Int = Int(arc4random_uniform(UInt32(count)))
            let item : AnyObject? = items[randomIndex]
            
            // Nationality
            person.nationality = item!.objectForKey("nationality") as? String
            
            let results = item!.objectForKey("results") as? NSArray
            let user = (results!.objectAtIndex(0) as? NSDictionary)!.objectForKey("user") as? NSDictionary
            
            // name
            let name = user!.objectForKey("name") as? NSDictionary
            person.title = name!.objectForKey("title") as? String
            person.firstName = name!.objectForKey("first") as? String
            person.surname = name!.objectForKey("last") as? String
            
            // address
            let address = user!.objectForKey("location") as? NSDictionary
            person.city = address?.objectForKey("city") as? String
            person.state = address?.objectForKey("state") as? String
            person.street = address?.objectForKey("street") as? String
            person.zip = address?.objectForKey("zip") as? String
            
            // Other data
            
            person.md5 = user!.objectForKey("md5") as? String
            
            // Images
            person.imageUrl = user!.objectForKey("picture")?.objectForKey("large") as? String
            person.loadImage()
        }
        return person
    }
}
