//
//  ViewController.swift
//  Cities
//
//  Created by K on 5/29/15.
//  Copyright (c) 2015 K. All rights reserved.
//

import UIKit

class CitiesViewController: UITableViewController {
    var cities: [City]?
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities?.count ?? 0
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let city = cities![indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("cityCell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = city.name
        cell.imageView?.image = city.image
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let indexPath = self.tableView.indexPathForSelectedRow() {
            let city = cities![indexPath.row]
            if let identifier = segue.identifier {
                switch identifier {
                case "showCityDetail":
                    if let cityDetailViewController = segue.destinationViewController as? CityDetailViewController {
                        cityDetailViewController.city = city
                    }
                default:
                    break
                }
            }
        }
    }
}


