//
//  ShapeComponents.swift
//  Gympact2.0
//
//  Created by Jordan Bhar on 2023-06-24.
//

import SwiftUI

struct ShapeComponents: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct InfoRectangleView: View {
    let width : CGFloat
    let height : CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.blue, lineWidth: 2)
                .frame(width: width, height: height)
                .background(Color.white)
        }
    }
}

struct CouraselView: View{
    
    var body: some View{
        TabView(){
            ForEach(0...4, id: \.self) { index in //need to make the forloop dynamic to the ammount of data given
                InfoRectangleView(width: UIScreen.main.bounds.width-20, height: 200)
                    .padding()
            }
        }
        .frame(height: 300)
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct ShapeComponents_Previews: PreviewProvider {
    static var previews: some View {
        CouraselView()
    }
}
