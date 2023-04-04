//
//  LoginPageViewModel.swift
//  TodoList
//
//  Created by Przemysław Kapica on 03/04/2023.
//

import Foundation
import SwiftUI

final class LoginViewModel: ObservableObject {
    private let authService: AuthService
    
    init(authService: AuthService = AuthServiceImpl()) {
        self.authService = authService
    }
    
    func signIn() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootViewController = windowScene.windows.first?.rootViewController else { return }
        
        
        authService.signInWithGoogle(rootViewController: rootViewController)
    }
}
