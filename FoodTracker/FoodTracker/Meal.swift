//
//  Meal.swift
//  FoodTracker
//
//  Created by Jose Fraga on 3/22/18.
//  Copyright © 2018 Jose Fraga. All rights reserved.
//

// class from the UIKit framework, importing UIKit also gives you access to Foundation.
import UIKit

class Meal {
    
    // (var) variables
    // (let) constants
    // MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // initializer is a method that prepares an instance of a class for use, which involves setting an initial value for each property.
    // Failable initializers always start with either init? or init!. These initializers return optional values or implicitly unwrapped optional values. Optionals can either contain a valid value or nil.
    // MARK: Initialization
    init?(name: String, photo: UIImage?, rating: Int) {
        
        // This code validates the incoming parameters and returns nil if they contain invalid values.
        // Initialization should fail if there is no name or if the rating is negative.
        /*if name.isEmpty || rating < 0 {
            return nil
        }*/
        
        // if statement above replaced with...
        // A guard statement declares a condition that must be true in order for the code after the guard statement to be executed.
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // The rating must be between 0 and 5 inclusively
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
    }
    
}
