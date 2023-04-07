//
//  ProfileViewModel.swift
//  TodoList
//
//  Created by Przemysław Kapica on 04/04/2023.
//

import Foundation
import GoogleSignIn
import FirebaseAuth

final class ProfileViewModel: ObservableObject {
    @Published var fullname: String
    @Published var photoUrl: URL?
    @Published var email: String?
    @Published var showErrorToast = false
    @Published var showSuccessToast = false
    
    private let notificationCenter: NotificationCenter
    private let authService: AuthService
    
    init(
        notificationCenter: NotificationCenter = .default,
        authService: AuthService = AuthServiceImpl()
    ) {
        self.fullname = Auth.auth().currentUser?.displayName ?? "Preview name"
        self.email = GIDSignIn.sharedInstance.currentUser?.profile?.email ?? "previewemail@mail.com"
        self.photoUrl = Auth.auth().currentUser?.photoURL
        
        self.notificationCenter = notificationCenter
        self.authService = authService
    }
    
    func signOut() {
        self.authService.signOut { error in
            if let error = error {
                self.showErrorToast = true
                print(error)
            } else {
                self.showSuccessToast = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.notificationCenter.post(name: .signedOut, object: nil)                    
                }
            }
        }
    }
}
