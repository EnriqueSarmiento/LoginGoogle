//
//  AuthViewModel.swift
//  LoginGoogle
//
//  Created by Enrique Sarmiento on 4/5/24.
//

import Foundation
import Firebase
import GoogleSignIn

class AuthViewModel: ObservableObject {
   
   @Published var loginState: Bool = false
   
   /** here we register an user for the first time the user*/
   func signIn(){
      /** here we asked if a register has already exists, otherwise we register the user*/
      if GIDSignIn.sharedInstance.hasPreviousSignIn() {
         GIDSignIn.sharedInstance.restorePreviousSignIn(){ [unowned self] (user, error) in
            authUser(user: user, error: error)
         }
      }else {
         // here we register a new user
         guard let clientID = FirebaseApp.app()?.options.clientID else {return}
         
         let configuration = GIDConfiguration(clientID: clientID)
         
         /** this represent the windows that will show to the user to type their signin info*/
         guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {return}
         guard let rootViewController = windowScene.windows.first?.rootViewController else {return}
         
         GIDSignIn.sharedInstance.configuration = configuration
         GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController){ [unowned self] (signInResult, error) in
            authUser(user: signInResult?.user, error: error)
            
         }
      }
   }
   
   /** here we had the logic to sign in an user*/
   func authUser(user: GIDGoogleUser?, error: Error?){
      if let error = error {
         print("DEBUG: error on authUser", error.localizedDescription)
         return
      }
      
      guard let idToken = user?.idToken else {return}
      guard let accessToken = user?.accessToken else {return}
      /** we need to pass our token as string, so we use a modifier for them*/
      let credentials = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)
      
      /** we use [unowned self] to allow to motate our self variable, otherwase we might have errors*/
      Auth.auth().signIn(with: credentials){ [unowned self] (_, error) in
         if let error = error {
            print("DEBUG: error on signin with credetencials", error.localizedDescription)
         }else{
            self.loginState = true
         }
         
      }
   }
   
   func signOut(){
      GIDSignIn.sharedInstance.signOut()
      do {
         try Auth.auth().signOut()
         loginState = false
      } catch let error as NSError {
         print("DEBUG: error on signout", error.localizedDescription)
      }
   }
}
