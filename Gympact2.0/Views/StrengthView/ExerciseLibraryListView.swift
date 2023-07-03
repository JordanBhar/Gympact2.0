//
//  ExerciseLibraryListview.swift
//  Gympact2.0
//
//  Created by Jordan Bhar on 2023-07-02.
//

import SwiftUI

struct ExerciseLibraryListView: View {
    @EnvironmentObject var workoutDBController : StrengthViewController
    @State private var selectedIndex : Int = -1
    
    var selectedGroup : String
    
    var body: some View {
        VStack{
            List{
                ForEach(self.workoutDBController.workoutList.enumerated().map({$0}), id: \.element.self){index, workout in

                    NavigationLink(destination: ExerciseLibraryDetailView(workout:self.workoutDBController.workoutList[index]).environmentObject(workoutDBController)){
                    
                        VStack(alignment: .leading){
                            Text("\(workout.name)")
                                .fontWeight(.bold)
                        }//VStack
                        .onTapGesture {
                            self.selectedIndex = index
                            print(#function, "selected book index : \(self.selectedIndex) \(workout)")

                        }//VStack
                    }//NavigationLink

                }//ForEach
            }//List ends
        }
        .navigationTitle(selectedGroup)
        .navigationBarTitleDisplayMode(.large)
        .onAppear{
            if(self.workoutDBController.workoutList != nil){
                self.workoutDBController.getCategoryWorkouts(category: selectedGroup)
            }
            
        }
    }
}

struct ExerciseLibraryListView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseLibraryListView(selectedGroup: "NA")
    }
}
