//
//  FitnessStatsView.swift
//  Gympact2.0
//
//  Created by Jordan Bhar on 2023-06-24.
//

import SwiftUI

struct FitnessStatsView: View {
    @State private var currentIndex: Int = 0
    private let colors: [Color] = [.red, .green, .blue, .yellow]
    var body: some View {
        
        BlackText(input: "Fitness Stats")
            .padding()
            .font(.title2)
        
        InfoRectangleView(width: UIScreen.main.bounds.width - 30, height: 200)
            .padding()
        
    }
    
    
    
    
}

struct FitnessStatsView_Previews: PreviewProvider {
    static var previews: some View {
        FitnessStatsView()
    }
}
