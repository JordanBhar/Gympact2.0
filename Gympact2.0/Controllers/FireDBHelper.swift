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
    
    @Published var currentUser : User?
    
    init(){
//        self.userData = User(uid: "", email: "", gender: "", age: 0, feet: 0, inches: 0, weight: 0.0, goal_weight: false, goal_muscle: false)
    }
    

    
    func registerUser(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if let error = error {
                    completion(.failure(error))
                } else if let user = result?.user {
                    let registeredUser = User(uid: user.uid, email: user.email ?? "", gender: "", age: -1, feet: 0, inches: 0, weight: 0, goal_weight: false, goal_muscle: false)
                    
                    Firestore.firestore().collection("Users").document(Auth.auth().currentUser!.uid).setData(["Email" : "\(registeredUser.email)" ,"Gender": "\(registeredUser.gender)", "Age": registeredUser.age, "Feet": registeredUser.feet , "Inches": registeredUser.inches , "Weight": registeredUser.weight, "Weight_Goal": registeredUser.goal_weight, "Muscle_Goal": registeredUser.goal_muscle])
                    
                    completion(.success(registeredUser))
                }
            }
        }
    
    
    func loginUser(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                completion(.failure(error))
            } else if let user = result?.user {
                let userData = Firestore.firestore().collection("Users").document(user.uid)
                
                userData.getDocument { (document, error) in
                    if let document = document, document.exists {
                        let data = document.data()
                        
                        let email = data?["Email"] as? String ?? ""
                        let gender = data?["Gender"] as? String ?? ""
                        let age = data?["Age"] as? Int ?? -1
                        let feet = data?["Feet"] as? Int ?? 0
                        let inches = data?["Inches"] as? Int ?? 0
                        let weight = data?["Weight"] as? Float ?? 0.0
                        let goalWeight = data?["Weight_Goal"] as? Bool ?? false
                        let goalMuscle = data?["Muscle_Goal"] as? Bool ?? false
                        
                        let loggedInUser = User(uid: user.uid, email: email, gender: gender, age: age, feet: feet, inches: inches, weight: weight, goal_weight: goalWeight, goal_muscle: goalMuscle)
                        
                        self.currentUser = loggedInUser // Set the currentUser
                        
                        completion(.success(loggedInUser))
                    } else {
                        print("Document does not exist")
                        completion(.failure(NSError(domain: "Firestore", code: -1, userInfo: [NSLocalizedDescriptionKey: "User data not found"])))
                    }
                }
            }
        }
    }
        
        func setUserData(userData: User){
            
            let db = Firestore.firestore()
            let data = db.collection("Users").document(Auth.auth().currentUser!.uid)
            data.updateData(["Gender": userData.gender, "Age": userData.age, "Feet":userData.feet, "Inches": userData.inches, "Weight": userData.weight, "Weight_Goal": userData.goal_weight, "Muscle_Goal": userData.goal_muscle]) { error in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
            
        }
        
        
        
    }


