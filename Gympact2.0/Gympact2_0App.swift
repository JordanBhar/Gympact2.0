//
//  Gympact2_0App.swift
//  Gympact2.0
//
//  Created by Jordan Bhar on 2023-06-20.
//

import SwiftUI
import Firebase
import FirebaseFirestore


@main
struct Gympact2_0App: App {
    
    let fireDBHelper = FireDBHelper()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(fireDBHelper)
        }
    }
}
