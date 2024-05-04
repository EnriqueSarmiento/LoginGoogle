//
//  LoginGoogleApp.swift
//  LoginGoogle
//
//  Created by Enrique Sarmiento on 4/5/24.
//

import SwiftUI
import Firebase

@main
struct LoginGoogleApp: App {
   
   @StateObject var viewModel = AuthViewModel()
   
   init(){
      setupAuth()
   }
   
    var body: some Scene {
        WindowGroup {
           ContentView().environmentObject(viewModel)
        }
    }
}

extension LoginGoogleApp {
   
   private func setupAuth(){
      FirebaseApp.configure()
   }
}
