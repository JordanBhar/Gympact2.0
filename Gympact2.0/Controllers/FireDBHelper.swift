//
//  FireDBHelper.swift
//  Gympact2.0
//
//  Created by Jordan Bhar on 2023-06-28.
//

import Foundation
import Firebase
import FirebaseAuth

class FireDBHelper: ObservableObject {
    
    init(){}
    
    
    func setUserData(userData: User){
        
        let db = Firestore.firestore()
        let data = db.collection("UserData").document(Auth.auth().currentUser!.uid)
        data.updateData(["Gender": userData.gender, "Age": userData.age, "Feet":userData.feet, "Inches": userData.inches, "Weight": userData.weight, "Weight_Goal": userData.goal_weight, "Muscle_Goal": userData.goal_muscle]) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
        
    }
    
    
    
    
}

