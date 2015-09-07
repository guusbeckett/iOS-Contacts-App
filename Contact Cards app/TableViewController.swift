//
//  TableViewController.swift
//  
//
//  Created by Guus Beckett on 07/09/15.
//
//

import UIKit

class TableViewController: UITableViewController {
    
    var contacts: [Contact] = []
    let generator = ContactGenerator()
    
    func fillArrayWithDummyData() {
        var i = 0
        var seeds: [String] = []
        while(i<14)
        {
            var newContact = generator.generate()
            if contains(seeds, newContact.md5!)==false
            {
                seeds.append(newContact.md5!)
                contacts.append(newContact)
                i++
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillArrayWithDummyData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return contacts.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> ContactTableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("contactCell", forIndexPath: indexPath) as! ContactTableViewCell
        
        let row = indexPath.row
        
        cell.contactFirstName?.text = contacts[row].firstName
        cell.contactSurname?.text = contacts[row].surname
        cell.contactImage?.image = contacts[row].image
        
        return cell
    }



    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Check if the right segue is handled
        if segue.identifier == "contactDetail" {
            
            // Get destination controller
            if let destination = segue.destinationViewController as? ContactDetailedViewController {
                
                // Get selected row and lookup selected person in array
                if let indexPath = self.tableView.indexPathForSelectedRow() {
                    
                    // Pass person to detailed view
                    let contact = contacts[indexPath.row]
                    destination.contact = contact
                    
                }
            }
        }
    }

}
