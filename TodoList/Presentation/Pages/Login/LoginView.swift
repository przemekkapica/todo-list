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
        ZStack {
            UniversalBackground()
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Express TODO")
                    .font(.largeTitle)
                Text("#getitgoing")
                    .font(.body)
                    .foregroundColor(.secondary)
                
                signInButton()
                    .padding(.top, 40)
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 46)
            .background(Color(uiColor: UIColor(named: "LoginBackground") ?? .systemBackground))
        }
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
