//
//  Homeview.swift
//  Gympact2.0
//
//  Created by Jordan Bhar on 2023-06-20.
//

import SwiftUI

struct HomeView: View {
    
    //on the home view i can add a calendar date slider so that the home view will show the Progress Stats, Fitness Stats , Intake stats of that day. we can make it so that we store data per day
    //for the slider i would like to make it so that you can go back and fourth each day with two arrow buttons (Left & Right) left being previous day , and right being next day
    //Alternativley i can add a calendar button to jump to a further date ahead,
    
    //lastly i want to be able to plan workouts ahead of time, maybe this can be done from the home screen or the strrength view screen
    
    @EnvironmentObject var fireDBHelper : FireDBHelper
    @State private var showSettings: Bool = false
    @State var selection : Int? = 0
    
    var body: some View {
        
        VStack(){
            
            NavigationLink(destination: SettingsView(), tag: 1, selection: self.$selection){}
            
            
            VStack(){
                HomeHeader(name : "\(fireDBHelper.currentUser?.email ?? "")", showSettings: $showSettings )
                
                WeekView()
            }
        
            ScrollView(.vertical){
                
                VStack(alignment: .leading){
                    
                    Group(){
                
                        Group(){
                            FitnessProgressView()
                        }
                        
                        
                        Group(){
                            NutritionIntakeView()
                        }
                    }
                    
        
                    
                }
                .padding()
            }
            
            
        }
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $showSettings) {
                    SettingsView()
                }
    }
}
    
    
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
