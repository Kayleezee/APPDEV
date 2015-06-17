//
//  ViewController.swift
//  Cities
//
//  Created by K on 5/29/15.
//  Copyright (c) 2015 K. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController {
    
    var city: City?
    @IBOutlet var cityButton: UIButton!
    
    override func viewWillAppear(animated: Bool) {
        cityButton.setTitle(city?.name, forState: .Normal)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "showCityDetail":
                if let cityDetailViewController = segue.destinationViewController as? CityDetailsViewController {
                    cityDetailViewController.city = self.city
                }
            default:
                break
            }
        }
    }
    
    @IBAction func unwindToCities(segue: UIStoryboardSegue) {
        
    }

}

