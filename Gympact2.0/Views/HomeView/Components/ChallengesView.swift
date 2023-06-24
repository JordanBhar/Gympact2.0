//
//  ChallengesView.swift
//  Gympact2.0
//
//  Created by Jordan Bhar on 2023-06-24.
//

import SwiftUI

struct NutritionIntakeView: View {
    var body: some View {
        
        BlackText(input:"Intake Stats")
            .padding()
            .font(.title2)
        
        InfoRectangleView(width: UIScreen.main.bounds.width-20, height: 200)
            .padding()
        
        
    
        //Add user input features to ask for how much water they are intakeing and check to see if its enough for their body weight
        //Same thing with food, however no need to enter in what they ate, just ask for calories and maybe marco nutrients
    }
}

struct NutritionIntakeView_Previews: PreviewProvider {
    static var previews: some View {
        NutritionIntakeView()
    }
}
