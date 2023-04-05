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
    
    init(notificationCenter: NotificationCenter = .default) {
        self.fullname = Auth.auth().currentUser?.displayName ?? "Preview name"
        self.email = GIDSignIn.sharedInstance.currentUser?.profile?.email ?? "previewemail@mail.com"
        self.photoUrl = Auth.auth().currentUser?.photoURL
        
        self.notificationCenter = notificationCenter
    }
    
    func signOut() {
        Task {
            do {
                try Auth.auth().signOut()
                GIDSignIn.sharedInstance.signOut()
            } catch let signOutError as NSError {
                print("Error signing out: %@", signOutError)
            }
            
            notificationCenter.post(name: .signedOut, object: nil)
        }
    }
}
