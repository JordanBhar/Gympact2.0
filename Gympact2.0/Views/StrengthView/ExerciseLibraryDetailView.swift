//
//  ExerciseLibraryDetailview.swift
//  Gympact2.0
//
//  Created by Jordan Bhar on 2023-07-02.
//

import AVKit
import SwiftUI

struct ExerciseLibraryDetailView: View {
    
    let workout : Exercises
    @State private var workoutName : String = ""
    @State private var player = AVPlayer()
    @EnvironmentObject var workoutDBController : StrengthViewController
    
    
    var body: some View {
        ScrollView(.vertical){
            VStack{
                Divider()
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
                //Note: When adding the video links to database make sure to get the embed link
                VideoView(URL: workout.url!)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                
                
                Divider()
                
                VStack(){
                    
                    Text("Muscle Groups")
                        .frame(width: UIScreen.main.bounds.size.width - 50, alignment: .leading)
                        .bold()
                        .padding(.bottom)
                    
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(workout.muscleGroups, id: \.self){ tag in
                                Text(tag)
                                    .frame(width: 100 , height: 35)
                                    .background(Color.blue)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(10.0)
                                    .font(.system(size: 12))
                                    .bold()
                                    
                            }
                            .frame(width: 75, alignment: .leading)
                            .padding()
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                }
                
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
                
                Text("Exercise Description")
                    .frame(width: UIScreen.main.bounds.size.width - 50, alignment: .leading)
                    .bold()
                    .padding(.bottom)
                Text(workout.description)
                    .frame(width: UIScreen.main.bounds.size.width - 50, alignment: .leading)
                Spacer()
            }
            .navigationTitle(workout.name)
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct WorkoutEduDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseLibraryDetailView(workout: Exercises())
    }
}

