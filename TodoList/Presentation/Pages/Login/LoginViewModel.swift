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
    private let notificationCenter: NotificationCenter
    
    init(
        authService: AuthService = AuthServiceImpl(),
        notificationCenter: NotificationCenter = .default
    ) {
        self.authService = authService
        self.notificationCenter = notificationCenter
    }
    
    func signIn() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootViewController = windowScene.windows.first?.rootViewController else { return }
        
        authService.signInWithGoogle(
            rootViewController: rootViewController
        ) { error in
                if let error = error {
                    // show it to UI
                    print(error)
                } else {
                    self.emitSignInState()
                }
            }
    }
    
    private func emitSignInState() {
        notificationCenter.post(name: .signedIn, object: nil)
    }
}
