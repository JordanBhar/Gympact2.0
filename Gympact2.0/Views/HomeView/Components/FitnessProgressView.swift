//
//  FitnessProgressView.swift
//  Gympact2.0
//
//  Created by Jordan Bhar on 2023-06-24.
//

import SwiftUI

struct FitnessProgressView: View {
    var body: some View {
        HStack(alignment: .top){
            
            Group(){
                ZStack(){
                    InfoRectangleView(width: 170.0 , height: 300.0 )
                    VStack(){
                        Text("SDSDSDD")
                        
                    }
                }
                .padding()
                
                VStack(){
                    Group(){
                        ZStack(){
                            InfoRectangleView(width: 140.0 , height: 130.0 )
                            VStack(){
                                Text("SDSDSDD")
                                
                            }
                        }
                        .padding()
                        
                        ZStack(){
                            InfoRectangleView(width: 140.0 , height: 130.0 )
                            VStack(){
                                Text("SDSDSDD")
                                
                            }
                        }
                        .padding()
                        
                    }
                }
                
            }
        }
    }
}

struct FitnessProgressView_Previews: PreviewProvider {
    static var previews: some View {
        FitnessProgressView()
    }
}
