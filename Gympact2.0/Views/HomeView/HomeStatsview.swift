//
//  HomeStatsview.swift
//  Gympact2.0
//
//  Created by Jordan Bhar on 2023-06-20.
//

import SwiftUI

struct HomeStatsview: View {
    @State private var currentIndex: Int = 0
    private let colors: [Color] = [.red, .green, .blue, .yellow]
    var body: some View {
        VStack {
            ScrollView(.horizontal , showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(0..<colors.count) { index in
                            Rectangle()
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .foregroundColor(colors[index])
                                .padding()
                                .frame(width: UIScreen.main.bounds.width)
                                
                            
                        }
                    }
                    .offset(x: -CGFloat(currentIndex) * UIScreen.main.bounds.width, y: 0)
                    .animation(.easeInOut)
                    .onAppear {
                        UIScrollView.appearance().bounces = false
                    }
                }
            }
        .frame(height: 200)
        
    }
}

struct HomeStatsview_Previews: PreviewProvider {
    static var previews: some View {
        HomeStatsview()
    }
}
