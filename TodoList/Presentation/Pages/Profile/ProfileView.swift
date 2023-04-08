//
//  ProfileView.swift
//  TodoList
//
//  Created by Przemysław Kapica on 04/04/2023.
//

import SwiftUI
import AlertToast

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        ZStack {
            UniversalBackground()
            
            VStack(spacing: 8) {
                Spacer()
                ProfileInfo(viewModel: viewModel)
                Spacer()
                signOutButton()
            }
            .padding(.horizontal, 24)
            .navigationBarTitle("")
            .toast(isPresenting: $viewModel.showErrorToast) {
                errorToast()
            }
            .toast(isPresenting: $viewModel.showSuccessToast, duration: 1) {
                successToast(title: "Signed out")
        }
        }
    }
    
    fileprivate func signOutButton() -> UniversalButton {
        return UniversalButton(
            title: "Sign out",
            icon: ButtonIcon(
                image: UIImage(systemName: "rectangle.portrait.and.arrow.right"),
                placement: .right
            )
        ) {
            viewModel.signOut()
        }
    }
}

struct ProfileInfo: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        AsyncImage(url: viewModel.photoUrl) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            Color.gray.opacity(0.2)
        }
        .frame(width: 100, height: 100)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        
        Text("\(viewModel.fullname)")
            .font(.title)
            .padding(.top, 16)
        if let email = viewModel.email {
            Text("\(email)")
                .font(.body)
                .foregroundColor(Color.secondary)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
