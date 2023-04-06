//
//  AuthService.swift
//  TodoList
//
//  Created by Przemysław Kapica on 04/04/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseCore
import FirebaseAuth
import GoogleSignIn


protocol AuthService {
    func signInWithGoogle(
        completion: @escaping SimpleAction,
        rootViewController: UIViewController)
}

final class AuthServiceImpl: AuthService {
    
    func signInWithGoogle(
        completion: @escaping SimpleAction,
        rootViewController: UIViewController
    ) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { result, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString
            else {
                print("User or id token is nil")
                return
            }
            
            let credential = GoogleAuthProvider.credential(
                withIDToken: idToken,
                accessToken: user.accessToken.tokenString)
            
            self.authWithFirebase(with: credential)
            
            completion()
        }
    }
    
    private func authWithFirebase(with credential: AuthCredential) {
        Auth.auth().signIn(with: credential) { result, error in
            if let error = error {
                print(error)
            }
        }
    }
}
