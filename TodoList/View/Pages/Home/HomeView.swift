//
//  HomePage.swift
//  TodoList
//
//  Created by Przemysław Kapica on 04/04/2023.
//

import SwiftUI
import GoogleSignIn

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                
            }
            .navigationTitle("Your TODOs")
            .toolbar {
                ToolbarItem {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        Image(systemName: "person.crop.circle")
                            .foregroundColor(Color.primary)
                    }
                }
            }
        }
    }
}


struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
