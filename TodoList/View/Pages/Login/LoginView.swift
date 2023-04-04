//
//  LoginPage.swift
//  TodoList
//
//  Created by Przemysław Kapica on 03/04/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text("Express TODO")
                .font(.largeTitle)
                
            UniversalButton(title: "Sign in with Google") {
                viewModel.signIn()
            }
        }
        .padding(.horizontal, 16)
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
