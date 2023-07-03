//
//  Mainview.swift
//  Gympact2.0
//
//  Created by Jordan Bhar on 2023-06-20.
//

import SwiftUI

struct MainView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem{
                    Label("Home", systemImage: "house")
                        .foregroundColor(Color.white)
                }
            
            StrengthView()
                .tabItem{
                    Label("Strength", systemImage: "dumbbell")
                }
            
            CardioView()
                .tabItem{
                    Label("Cardio", systemImage: "figure.run")
                }

        }
        .accentColor(Color("Selected"))
       
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
