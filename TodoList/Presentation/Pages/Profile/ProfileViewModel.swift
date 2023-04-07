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
                // show it to UI
                print(error)
            } else {
                self.notificationCenter.post(name: .signedOut, object: nil)
            }
        }
    }
}
