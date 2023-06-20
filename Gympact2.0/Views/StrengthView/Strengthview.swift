//
//  Strengthview.swift
//  Gympact2.0
//
//  Created by Jordan Bhar on 2023-06-20.
//

import SwiftUI

struct Strengthview: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Strength Training")
                    .font(.title)
                
                HStack(spacing: 20) {
                    NavigationLink(destination: MuscleGroupCategoriesView()) {
                        TrainingTile(title: "Muscle Groups", imageName: "muscle_groups")
                    }
                    
                    NavigationLink(destination: CreateWorkoutView()) {
                        TrainingTile(title: "Create Workout", imageName: "create_workout")
                    }
                }
                
                // Add more tiles here as needed
                
                Spacer()
            }
            .padding()
            .navigationTitle("Strength")
        }
    }
}

struct MuscleGroupCategoriesView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Muscle Group Categories")
                .font(.title)
            
            // Display muscle group categories here
            
            Spacer()
        }
        .padding()
        .navigationTitle("Muscle Groups")
    }
}

struct CreateWorkoutView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Create Workout")
                .font(.title)
            
            // Display workout creation UI here
            
            Spacer()
        }
        .padding()
        .navigationTitle("Create Workout")
    }
}

struct TrainingTile: View {
    let title: String
    let imageName: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 100)
                .cornerRadius(10)
            
            Text(title)
                .font(.subheadline)
                .fontWeight(.bold)
        }
    }
}

struct StrengthSectionView_Previews: PreviewProvider {
    static var previews: some View {
        Strengthview()
    }
}

