//
//  AppViewModel.swift
//  TodoList
//
//  Created by Przemysław Kapica on 04/04/2023.
//

import Foundation
import SwiftUI
import GoogleSignIn
import FirebaseAuth
import Combine

final class AppViewModel: ObservableObject {
    @Published var appState: AppState = .loading
    
    private let notificationCenter: NotificationCenter
    private var cancellables = Set<AnyCancellable>()
    
    init(notificationCenter: NotificationCenter = .default) {
        self.notificationCenter = notificationCenter
        
        initNotificationCenter()
        restorePreviousSignIn()
    }
    
    private func updateAppState(for state: AppState) {
        Task {
            await MainActor.run {
                withAnimation {
                    appState = state
                }
            }
        }
    }
    
    private func initNotificationCenter() {
        notificationCenter.publisher(for: .signedIn)
            .sink { [weak self] _ in
                self?.updateAppState(for: .signedIn)
            }
            .store(in: &cancellables)
        
        notificationCenter.publisher(for: .signedOut)
            .sink { [weak self] _ in
                self?.updateAppState(for: .signedOut)
            }
            .store(in: &cancellables)
        
        notificationCenter.publisher(for: .loading)
            .sink { [weak self] _ in
                self?.updateAppState(for: .loading)
            }
            .store(in: &cancellables)
    }
    
    private func restorePreviousSignIn() {
        GIDSignIn.sharedInstance.restorePreviousSignIn { [weak self] _, error in
            if let error = error {
                self?.updateAppState(for: .signedOut)
                print(error)
            } else {
                self?.checkIfSignedIn()
            }
            
        }
    }
    
    private func checkIfSignedIn() {
        if let user = GIDSignIn.sharedInstance.currentUser {
            guard let idToken = user.idToken?.tokenString else {
                updateAppState(for: .signedOut)
                return
            }
            
            let credential = GoogleAuthProvider.credential(
                withIDToken: idToken,
                accessToken: user.accessToken.tokenString
            )
            
            authorize(with: credential)
        } else {
            updateAppState(for: .signedOut)
        }
    }
    
    private func authorize(with credential: AuthCredential) {
        Auth.auth().signIn(with: credential) { [weak self] _, error in
            guard let self = self else { return }
            
            if let error = error {
                self.updateAppState(for: .signedOut)
                print(error)
                return
            }
            
            self.updateAppState(for: .signedIn)
        }
    }
}
