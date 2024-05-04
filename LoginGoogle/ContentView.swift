//
//  ContentView.swift
//  LoginGoogle
//
//  Created by Enrique Sarmiento on 4/5/24.
//

import SwiftUI

struct ContentView: View {
   
   @EnvironmentObject var viewModel: AuthViewModel
   
    var body: some View {
       Group{
          if viewModel.loginState {
             HomeView()
          }else{
             LoginView()
          }
       }
    }
}
