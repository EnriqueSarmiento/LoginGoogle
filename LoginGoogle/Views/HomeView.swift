//
//  HomeView.swift
//  LoginGoogle
//
//  Created by Enrique Sarmiento on 4/5/24.
//

import SwiftUI
import GoogleSignIn

struct HomeView: View {
   
   @EnvironmentObject var viewModel: AuthViewModel
   /** this variable will help to get user information */
   let user = GIDSignIn.sharedInstance.currentUser
   
    var body: some View {
       NavigationView{
          VStack(alignment: .center){
             AsyncImage(url: user?.profile?.imageURL(withDimension: 200))
             
             Text(user?.profile?.name ?? "")
                .font(.headline)
             
             Text(user?.profile?.email ?? "")
                .font(.subheadline)

             Spacer()
             
             Button {
                viewModel.signOut()
             } label: {
                Text("salir")
                
             }.buttonStyle(BorderedButtonStyle())
                .tint(.red)

          }.navigationTitle("Home")
             .padding(.all)
       }
    }
}
