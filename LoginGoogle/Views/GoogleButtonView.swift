//
//  GoogleButtonView.swift
//  LoginGoogle
//
//  Created by Enrique Sarmiento on 4/5/24.
//

import SwiftUI
import GoogleSignIn

struct GoogleButtonView: UIViewRepresentable {

   
   @Environment(\.colorScheme) var colorScheme
   
   private var button = GIDSignInButton()

   func makeUIView(context: Context) -> GIDSignInButton {
      button.colorScheme = colorScheme == .dark ? .dark : .light
      
      return button
   }
   
   func updateUIView(_ uiView: GIDSignInButton, context: Context) {
      button.colorScheme = colorScheme == .dark ? .dark : .light
   }
   
}
