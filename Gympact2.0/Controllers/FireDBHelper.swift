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
    

    func loginUser(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if let error = error {
                    completion(.failure(error))
                } else if let user = result?.user {
                    let loggedInUser = User(uid: user.uid, email: user.email ?? "", gender: "", age: -1, feet: 0, inches: 0, weight: 0, goal_weight: false, goal_muscle: false)
                    completion(.success(loggedInUser))
                }
            }
        }
    
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

