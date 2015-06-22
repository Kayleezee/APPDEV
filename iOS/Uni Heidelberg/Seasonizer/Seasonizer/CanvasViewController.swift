//
//  CanvasViewController.swift
//  Seasonizer
//
//  Created by Naumann, Klaus on 22.06.15.
//  Copyright (c) 2015 Naumann, Klaus. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var accessoryOverlayView: UIView!
    
    
    
    //: USER FUNCTIONS
    @IBAction func cameraButtonPressed(sender: AnyObject) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            alertController.addAction(UIAlertAction(title: "Take Photo",
                style: .Default, handler: { action in self.presentImagePickerWithSourceType(.Camera)
            }))
        }
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
            alertController.addAction(UIAlertAction(title: "Choose from Photo Library", style: .Default, handler: { action in self.presentImagePickerWithSourceType(.Camera)
            }))
        }
        alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func presentImagePickerWithSourceType(sourceType: UIImagePickerControllerSourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = self
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
        
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        self.photoImageView.image =
            info[UIImagePickerControllerOriginalImage] as? UIImage
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
}