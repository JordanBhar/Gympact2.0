//
//  HorizontalWorkoutView.swift
//  Gympact2.0
//
//  Created by Jordan Bhar on 2023-06-20.
//

import SwiftUI

struct HorizontalWorkoutView: View {
    @State private var selection = 0
    var body: some View {
        
        ScrollView(.horizontal){
            HStack(spacing: 20){
                ForEach(0...3, id: \.self){ index in
                    Button(action: {
                        self.selection = 1
                    }){
                        Text("a")
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
    }
}

struct HorizontalWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalWorkoutView()
    }
}
