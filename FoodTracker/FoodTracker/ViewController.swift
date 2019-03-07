//
//  ViewController.swift
//  FoodTracker
//
//  Created by Jose Fraga on 3/14/18.
//  Copyright © 2018 Jose Fraga. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate,
    UINavigationControllerDelegate {
    // Creating outlet to interface object since i will be either accessing a value from the interface object or modifying the interface object in my code.
    // Hence i did not create an outlet for the button, since i will not be modifying it.
    // Outlets let you refer to your interface elements in code. Still need a way to respond when a user interacts with the elements. Actions...
    // Store a reference to the text field, label, and image view and configures the storyboard to set up that connection.
    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    
    // Called when the view controller's content view is created and loaded from a storyboard. The view controller's outlets are guaranteed to have valid values by the time this method is called.
    // Use this method to perform any additional setup required by your view controller.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // self refers to the ViewController class.
        // Handle the text field's user input through delegate callbacks.
        nameTextField.delegate = self
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // To resign the text field's first-responder status.
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    // This method gives you a chance to read the information entered into the text field and do somthing with it. In your case, you'll take the text that's in the text field and use it to change the value of your label.
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }

    // MARK: UIImagePickerControllerDelegate

    // Gets called when a user taps the image picker's Cancel button. Gives you a chance to dismiss the UIImagePickerController.
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    // Gets called when a user selects a photo. Gives you a chance to do something with the image or images that the user selected from the picker. In your case, take the selected image and display it in your image view.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as?
        UIImage else {
            // Method logs an error message to the console, and then causes the app to terminate-preventing it from continuing in an invalid state.
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
                
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Actions
    @IBAction func SelectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // If the user taps the image view while typing in the text field, the keyboard is dismissed properly.
        // Hide the keyboard.
        nameTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // .photoLibrary option uses the simulator's camera roll
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        // A method being called on ViewController
        present(imagePickerController, animated: true, completion: nil)
    }
    
    // testing...but also was deleted from the Interface i think Builder
    /*@IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }*/
}

