//
//  CityDetailViewController.swift
//  Cities
//
//  Created by K on 5/29/15.
//  Copyright (c) 2015 K. All rights reserved.
//

import UIKit

class CityDetailsViewController: UIViewController {
    
    var city: City?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewWillAppear(animated: Bool) {
        self.nameLabel.text = city?.name
        self.imageView.image = city?.image
    }
}
