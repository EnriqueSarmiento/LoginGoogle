//
//  LoginView.swift
//  LoginGoogle
//
//  Created by Enrique Sarmiento on 4/5/24.
//

import SwiftUI

struct LoginView: View {
   
   @EnvironmentObject var viewModel: AuthViewModel
   
   var body: some View {
      VStack(alignment: .center){
         
         Text("Login with Google")
            .fontWeight(.black)
            .foregroundColor(.red)
            .font(.largeTitle)
         GoogleButtonView()
            .frame(height: 50,alignment: .center)
            .onTapGesture {
               viewModel.signIn()
            }
         
      }.padding(.all)
      
   }
}
