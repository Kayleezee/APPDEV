//
//  ViewController.swift
//  BMI
//
//  Created by K on 5/29/15.
//  Copyright (c) 2015 K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var massTextfield: UITextField!
    @IBOutlet var heightTextfield: UITextField!
    @IBOutlet var resultLabel: UILabel!
    
    @IBAction func getBMIButtonPressed(sender: UIButton) {
        let numberFormatter = NSNumberFormatter()
        
        let mass = numberFormatter.numberFromString(self.massTextfield.text)?.floatValue
        let height = numberFormatter.numberFromString(self.heightTextfield.text)?.floatValue
        
        let result = mass! / (height! * height!)
        
        self.resultLabel.text = String(format: "Your BMI: %.2f", result)
    }


}

