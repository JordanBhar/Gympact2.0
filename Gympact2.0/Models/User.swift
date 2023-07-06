//
//  User.swift
//  Gympact2.0
//
//  Created by Jordan Bhar on 2023-06-28.
//

import Foundation

class User: Identifiable{
    
    let uid: UUID
    let email: String
    
    var gender: String = ""
    var age: Int = 0
    var feet: Int = 0
    var inches: Int = 0
    var weight: Float = 0.0
    var goal_weight: Bool = false
    var goal_muscle: Bool = false
    
    
    init(uid: String, email: String, gender: String, age: Int, feet: Int, inches: Int, weight: Float, goal_weight: Bool, goal_muscle: Bool){
        self.uid = UUID(uuidString: uid) ?? UUID() 
        self.email = email
        self.inches = inches
        self.age = age;
        self.feet = feet
        self.gender = gender
        self.weight = weight
        self.goal_weight = goal_weight
        self.goal_muscle = goal_muscle
    }
    
}

