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
            
            signInButton()
        }
        .padding(.horizontal, 24)
    }
    
    fileprivate func signInButton() -> UniversalButton {
        return UniversalButton (
            title: "Sign in with Google",
            icon: ButtonIcon(
                image: UIImage(named: "GoogleLogo"),
                placement: .left,
                preserveColor: true
            )
        ) {
            viewModel.signIn()
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
