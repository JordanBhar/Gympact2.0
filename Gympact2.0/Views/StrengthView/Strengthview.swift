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
    @State private var showAlert = false
    
    var body: some View {
        VStack(alignment: .leading){
            
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
                .padding()

                
                
                
            }
            
            ScrollView(.vertical){
                VStack(alignment: .leading){
                    Group(){
                        BlackText(input: "Strength Training")
                            .font(.title)
                            .padding()
                        CouraselView()
                    }
                    
                    Group(){
                        BlackText(input: "Strength Training")
                            .font(.title)
                            .padding()
                        CouraselView()
                    }
                    
                    Group(){
                        ZStack(){
                            InfoRectangleView(width: UIScreen.main.bounds.width-20, height: 100)
                                .padding()
                            Text("Workout Libarary")
                                .font(.title2)
                        }
                        .onTapGesture {
                            showAlert = true //need to change this to a navigaton
                        }
                    }
                }
            }
            
            
            Spacer()
            
        }
    }
}

struct Strengthview_Previews: PreviewProvider {
    static var previews: some View {
        Strengthview()
    }
}
