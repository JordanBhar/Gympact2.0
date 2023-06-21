//
//  Mainview.swift
//  Gympact2.0
//
//  Created by Jordan Bhar on 2023-06-20.
//

import SwiftUI

struct Mainview: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            Homeview()
                .tabItem{
                    Label("Home", systemImage: "house")
                        .foregroundColor(Color.white)
                }
            
            Strengthview()
                .tabItem{
                    Label("Strength", systemImage: "dumbbell")
                }
            
            Cardioview()
                .tabItem{
                    Label("Cardio", systemImage: "figure.run")
                }

        }
        .accentColor(Color("Selected"))
       
    }
}

struct Mainview_Previews: PreviewProvider {
    static var previews: some View {
        Mainview()
    }
}
