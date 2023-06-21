//
//  Homeview.swift
//  Gympact2.0
//
//  Created by Jordan Bhar on 2023-06-20.
//

import SwiftUI

struct Homeview: View {
    

    var body: some View {
        VStack(spacing: 20){
            Group{
                HomeHeader(name : "Jordan")
                Divider()
            }
            
            
            Group(){
                VStack(alignment: .leading){
                    BlackText(input: "Fitness Stats")
                        .padding()
                        .font(.title2)
                    HomeStatsview()
                }
                
                
            }
            
            Spacer()
            }
        }
    }

struct Homeview_Previews: PreviewProvider {
    static var previews: some View {
        Homeview()
    }
}
