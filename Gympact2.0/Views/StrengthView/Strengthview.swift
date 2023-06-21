//
//  Strengthview.swift
//  Gympact2.0
//
//  Created by Jordan Bhar on 2023-06-20.
//

import SwiftUI

struct Strengthview: View {
    private var optionsList : [String] = ["Create Workout" , "Workout Library"]
    @State private var selection = 0
    var body: some View {
        VStack(alignment: .leading, spacing: 50){
            
            BlackText(input: "Strength Training")
                .font(.largeTitle)
                .padding()
            
            VStack{
                //need to make it so that either a sheet will pop up to create a workout
                //navigate to the workout library if the other one is clicked
                Group(){
                    HStack{
                        ForEach(0...optionsList.count-1, id: \.self){ index in
                            Button(action: {
                                self.selection = 1
                            }){
                                Text("\(optionsList[index])")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 30))
                            }
                            .frame(width: 175, height: 100)
                            .background(Color.blue)
                            .cornerRadius(15)
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.blue, lineWidth: 1))
                        }

                    }
                }
                .padding(EdgeInsets(top:-30 , leading: 0, bottom: 40 , trailing: 0))

                
                
                Group(){
                    HStack{
                        BlackText(input: "My Workouts")
                            .font(.title)
                        
                        Spacer()
                    }
                        
                    
                    HorizontalWorkoutView() //this will need to display a list of workouts
                        .padding()
                        .frame(width: UIScreen.main.bounds.width)
                }
                
                
                Group(){
                    HStack{
                        BlackText(input: "Explore Workouts")
                            
                            .font(.title)
                        
                        Spacer()
                    }
                  
                    
                    HorizontalWorkoutView() //this will need to display a list of workouts
                        .padding()
                        .frame(width: UIScreen.main.bounds.width)

                }
            }
            
            
            
            Spacer()
        }
        .padding(EdgeInsets(top:0 , leading: 50, bottom: 0 , trailing: 50))
    }
}

struct Strengthview_Previews: PreviewProvider {
    static var previews: some View {
        Strengthview()
    }
}
