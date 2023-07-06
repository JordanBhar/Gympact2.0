//
//  ContentView.swift
//  Gympact2.0
//
//  Created by Jordan Bhar on 2023-06-20.
//

import SwiftUI


struct ContentView: View {
    
    @State private var maxWidth: CGFloat = .zero
    @State private var selection: Int? = nil
    
    var body: some View {

        NavigationView {
            
            VStack{
                
                NavigationLink(destination: LoginView(), tag: 1, selection: self.$selection){}
                
                NavigationLink(destination: RegisterView(), tag: 2, selection: self.$selection){}
                
                Image("Logo")
                    .resizable()
                    .frame(width: 350, height: 150)
                
                Image("Deadlift")
                    .resizable()
                    .frame(width: 330, height: 335)
                
                Spacer()
                
                Button(action: {
                    self.selection = 1
                    
                }){
                    //appearance
                    Text("LOGIN")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 10)
                        .frame(minWidth: maxWidth)
                        .background(rectReader($maxWidth))
                }//Sign In Button ends
                .background(Color.indigo)
                .cornerRadius(50)
                .buttonStyle(CustomButton())
                .padding(.bottom, 20)
                
                
                
                
                Button(action: {
                    self.selection = 2
                }){
                    //appearance
                    Text("REGISTER")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 10)
                        .frame(minWidth: maxWidth)
                        .background(rectReader($maxWidth))
                }//Sign In Button ends
                .background(Color.indigo)
                .cornerRadius(50)
                .buttonStyle(CustomButton())
                
                
            
                
            }.padding(.bottom, 75) //vstack
            
        }//nav stack
        .navigationBarBackButtonHidden(true)
        
      
        
    }
    
}

private func rectReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { gp -> Color in
            DispatchQueue.main.async {
                binding.wrappedValue = max(binding.wrappedValue, gp.frame(in: .local).width)
            }
            return Color.clear
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
