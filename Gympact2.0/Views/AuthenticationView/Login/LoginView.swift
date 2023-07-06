//
//  Loginview.swift
//  Gympact2.0
//
//  Created by Jordan Bhar on 2023-06-20.
//

import SwiftUI
import Firebase
import FirebaseAuth

    struct LoginView: View {
        
        @EnvironmentObject var fireDBHelper : FireDBHelper

        
        @State var email: String = ""
        @State var password: String = ""
        @State private var selection: Int? = nil
        @State private var userLoggedIn = false
        @State private var showingAlert = false
        @State private var msg = ""
        private var num: Int = 1
        
        var body: some View {
            
                VStack(spacing: 30){
                    
                    NavigationLink(destination: RegisterView(), tag: 1, selection: self.$selection){}
                                    
                    NavigationLink(destination: RegisterInfoView(), tag: 2, selection: self.$selection){}
                    
                    NavigationLink(destination: MainView(), tag: 3, selection: self.$selection){}
                    
                    Spacer()
                    
                    Text("LOGIN")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .foregroundColor(Color.blue)
                        .padding(.bottom, 100)
                    
                    
                    // Form
                    VStack(spacing: 25){
                        TextField("Email", text: $email)
                            .padding(10)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 0.5).frame(height: 45))
                            .multilineTextAlignment(.center)
                        
                        VStack(spacing:10){
                            SecureField("Password", text: $password)
                                .padding(10)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 0.5).frame(height: 45))
                                .multilineTextAlignment(.center)
                            
                        }
                    }
                    
                    // SignIn
                    Button(action: {
                        fireDBHelper.loginUser(email: self.email, password: self.password){ result in
                            switch result {
                            case .success(let user):
                                print("Login successful for user: \(user.email)")
                                // Handle successful login, such as navigating to a new view
                                let ref = Firestore.firestore().collection("Users")
                                ref.whereField("Gender", isEqualTo: "").getDocuments { (querySnapshot, error) in
                                    if error != nil {
                                        // Handle error
                                    } else {
                                        if !querySnapshot!.isEmpty { //if user
                                            self.selection = 2 //has no data take them to this
                                            //MARK: change this back to 2 i.e this is the flow if the user logs in for the first time after registering an account
                                        } else {
                                            self.selection = 3 // if they have entered in starting data send them to regular home screen
                                        }
                                    }
                                }
                            case .failure(let error):
                                print("Login failed: \(error.localizedDescription)")
                                // Handle login failure, such as displaying an error message
                            }
                        }
                    }){
                        Text("Sign In")
                            .modifier(CustomTextM(fontName: "MavenPro-Bold", fontSize: 16, fontColor: Color.white))
                        
                            .frame(maxWidth: .infinity)
                            .frame(height: 56, alignment: .leading)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .alert(self.msg, isPresented: $showingAlert) {
                                Button("OK", role: .cancel) { }
                            }
                    
                    Spacer()
                    
                    // SignUp
                    VStack(spacing: 10){
                        Text("Don't have an account?")
                            .modifier(CustomTextM(fontName: "Oxygen-Regular", fontSize: 18, fontColor: Color.primary))
                        Button(action: {
                            self.selection = 1
                        }){
                            Text("Register")
                                .modifier(CustomTextM(fontName: "Oxygen-Bold", fontSize: 18, fontColor: Color.blue))
                        }
                    }
                }
                .navigationBarBackButtonHidden(true)
                .padding(.horizontal,30)
                .padding(.vertical, 25)
                .onAppear {
                    Auth.auth().addStateDidChangeListener{auth, user in
                        if user != nil {
                            userLoggedIn.toggle()
                        }
                    }
                }
        }
    }
    
    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
        }
    }
