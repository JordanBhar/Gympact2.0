//
//  WorkoutLibraryView.swift
//  Gympact2.0
//
//  Created by Jordan Bhar on 2023-06-26.
//

import SwiftUI
import FirebaseFirestore
import FirebaseDatabase


struct ExerciseLibraryView: View {
    
    let workoutDBController = StrengthViewController(database: Firestore.firestore())
    
    @State private var selectedIndex : Int = -1
    @State private var selectedWorkoutGroup : String = "NA"
    @State private var selection : Int? = nil // navigation selection
    @State private var workoutList : [Exercises] = []
    
    
    private var workoutGroups : [String] = ["Back & Biceps", "Chest & Triceps", "Front legs", "BackLegs" , "Abs & Shoulders"]
    
    
    var body: some View {
            
        ScrollView(.vertical){
            VStack{
                
                NavigationLink(destination: ExerciseLibraryListView(selectedGroup: selectedWorkoutGroup).environmentObject(workoutDBController), tag: 1, selection: self.$selection){}

                VStack(spacing: 30){
                    
                    ForEach(0..<workoutGroups.count, id: \.self){ workoutGroup in
                        Button(action: {
                            self.selection = 1
                            self.selectedWorkoutGroup = workoutGroups[workoutGroup]
                        }){
                            Text("\(workoutGroups[workoutGroup])")
                                .foregroundColor(Color.white)
                                .font(.system(size: 30))
                        }
                        .frame(width: 300, height: 100)
                        .background(Color.blue)
                        .cornerRadius(15)
                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.blue, lineWidth: 1))
                    }
                }
            }
        }
    }
}

struct ExerciseLibraryView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseLibraryView()
    }
}
