//
//  TextComponents.swift
//  Gympact2.0
//
//  Created by Jordan Bhar on 2023-06-20.
//

import SwiftUI

struct BlackText: View {
    var input : String
    var body: some View {
        Text(input)
            .foregroundColor(Color.black)
    }
}

struct CustomTextM: ViewModifier {
    //MARK:- PROPERTIES
    let fontName: String
    let fontSize: CGFloat
    let fontColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.custom(fontName, size: fontSize))
            .foregroundColor(fontColor)
    }
}

struct BlackText_Previews: PreviewProvider {
    static var previews: some View {
        BlackText(input: "")
    }
}
