//
//  SettingsView.swift
//  Gympact2.0
//
//  Created by Jordan Bhar on 2023-07-06.
//

import SwiftUI

struct SettingsView: View {
    @State private var profileImage: Image?
    @State private var name: String = ""
    @State private var age: Int = 0
    @State private var email: String = ""
    @State private var weight: Double = 0.0
    @State private var height: Double = 0.0
    
    var body: some View {
        VStack {
            Button(action: {
                // Add logic to handle photo selection
            }) {
                ZStack {
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 150, height: 150)
                    Image(systemName: "plus")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
            }
            .padding()
            
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Stepper(value: $age, in: 0...150, label: {
                Text("Age: \(age)")
            })
            .padding()
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Weight", value: $weight, formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Height", value: $height, formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Spacer()
        }
        .navigationBarTitle("Settings")
    }
}

struct UserSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
