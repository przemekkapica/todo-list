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
        rootViewController: UIViewController,
        completion: @escaping DefaultCompletion
    )
    
    func signOut(completion: @escaping DefaultCompletion)
}

final class AuthServiceImpl: AuthService {
    func signInWithGoogle(
        rootViewController: UIViewController,
        completion: @escaping DefaultCompletion
    ) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { result, error in
            if let error = error {
                completion(error)
                return
            }
            
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString
            else {
                completion(CustomError.authenticationError)
                return
            }
            
            let credential = GoogleAuthProvider.credential(
                withIDToken: idToken,
                accessToken: user.accessToken.tokenString
            )
            
            Auth.auth().signIn(with: credential) { _, error in
                completion(error)
                return
            }
            
            completion(nil)
        }
    }
    
    func signOut(completion: @escaping DefaultCompletion) {
        do {
            try Auth.auth().signOut()
            GIDSignIn.sharedInstance.signOut()
            completion(nil)
        } catch {
            completion(error)
        }
    }
}
