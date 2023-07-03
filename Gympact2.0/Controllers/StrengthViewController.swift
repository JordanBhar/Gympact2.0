//
//  StrengthViewController.swift
//  Gympact2.0
//
//  Created by Jordan Bhar on 2023-07-02.
//

import Foundation
import FirebaseFirestore

class StrengthViewController : ObservableObject{
    
    @Published var workoutList = [Exercises]()
    
    private let store : Firestore
    private let COLLECTION_Workouts : String = "MuscleGroups"
    
    private let SUB_COLLECTION_EXERCISES : String = "Exercises"

    
    //singleton design pattern
    private static var shared : StrengthViewController?
    
    init(database : Firestore){
        self.store = database
    }
    
    static func getInstance() -> StrengthViewController{
        if (shared == nil){
            shared = StrengthViewController(database: Firestore.firestore())
        }
        
        return shared!
    }
    
    
    func getCategoryWorkouts(category : String){ //This method only stores one category of workouts one category at a time, dont use this method to get a list of all the workouts & categories
        
        self.workoutList.removeAll()
        
//        let loggedInUser : String = UserDefaults.standard.string(forKey: "KEY_EMAIL") ?? "NA"
        
        self.store
            .collection(COLLECTION_Workouts)
            .document(category)
            .collection(SUB_COLLECTION_EXERCISES)
            .order(by: "name", descending: true)
            .addSnapshotListener({ (querySnapshot, error)  in
                
                guard let snapshot = querySnapshot else{
                    print(#function, "Error while retrieving records \(error)")
                    return
                }
                
                snapshot.documentChanges.forEach{ (docChange) in
                    do{
                        var workout = Exercises()
                        workout = try docChange.document.data(as: Exercises.self)
                        
                        let docID = docChange.document.documentID
                        workout.id = docID
                        
                        let matchedIndex = self.workoutList.firstIndex(where: { ($0.id?.elementsEqual(docID))! })
                        
                        print("Matched Index: \(matchedIndex)")
                        
                        if docChange.type == .added{
                            self.workoutList.append(workout)
                            print(#function, "Document ADDED : \(workout)")
                            print("TEST \(self.workoutList)")
                        }
                        
                        if docChange.type == .modified{
                            //change or replace current object in bookList with updated values
                            
                            if(matchedIndex != nil){
                                self.workoutList[matchedIndex!] = workout
                            }
                        }

                        if docChange.type == .removed{
                            if(matchedIndex != nil){
                                self.workoutList.remove(at: matchedIndex!)
                            }
                        }
                    }catch let err as NSError{
                        print(#function, "unable to identify document change \(err)")
                    }
                }
                
            })
    }
    
    
    
}
