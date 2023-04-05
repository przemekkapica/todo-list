//
//  ProfileView.swift
//  TodoList
//
//  Created by Przemysław Kapica on 04/04/2023.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        VStack(spacing: 8) {
            Spacer()
            ProfileInfo(viewModel: viewModel)
            Spacer()
            UniversalButton(title: "Sign out") {
                viewModel.signOut()
            }
        }.padding(.horizontal, 16)
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
