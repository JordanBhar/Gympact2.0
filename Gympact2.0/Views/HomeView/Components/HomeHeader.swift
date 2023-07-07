//
//  HomeHeader.swift
//  Gympact2.0
//
//  Created by Jordan Bhar on 2023-06-20.
//

import SwiftUI

struct HomeHeader: View {
    var name: String? = ""
    
    var motivationList: [String] = ["Feeling Energized? Let's Go", "Ready to Workout?", "Feeling Tired, Keep Going"]
    
    @State private var selectedPhrase: String? = nil
    @State private var sort: Int = 0
    @Binding var showSettings: Bool

    
    var body: some View {
        NavigationView {
            HStack(alignment: .center) {
                
                
                VStack(alignment: .leading) {
                    Text("Hello, \(self.name ?? "")")
                        .bold()
                        .font(.largeTitle)
                    
                    BlackText(input: self.selectedPhrase ?? "")
                }
                
                Spacer()
                
                
                Button(action:{
                    showSettings = true
                }){
                    Image("Profile")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 60, height: 60)
                }
                
                
            }
            .padding()
        }
        .frame(height: 75)
        .onAppear {
            self.selectedPhrase = self.motivationList.randomElement()
        }
    }
}

struct HomeHeader_Previews: PreviewProvider {
    @State static var showSettings: Bool = false
    
    static var previews: some View {
        HomeHeader(name: "John Doe", showSettings: $showSettings)
    }
}



