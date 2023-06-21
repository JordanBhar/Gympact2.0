//
//  HomeHeader.swift
//  Gympact2.0
//
//  Created by Jordan Bhar on 2023-06-20.
//

import SwiftUI

struct HomeHeader: View {
    
    
    var name : String
    
    var motivationList : [String] = ["Feeling Energized? Lets Go" , "Ready to Workout ?", "Feeling Tired, Keep Going"]
    
    @State private var selectedPhrase : String? = nil
    
    var body: some View {
        VStack{
            HStack(alignment: .top){
                VStack(alignment: .leading, spacing: 20){
                    BlackText(input: "Hello, \(name)") //need to change this to a variable
                        .font(.title)
                    BlackText(input: selectedPhrase ?? "")
                        .font(.callout)
                }
                
                Spacer()
                
                Image(systemName: "dumbbell")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .frame(width: 50)
            }
        }
        .padding()
        .onAppear(){
            selectedPhrase = self.motivationList.randomElement()
        }
    }
}

struct HomeHeader_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeader(name: "")
    }
}
