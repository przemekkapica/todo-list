//
//  App.swift
//  TodoList
//
//  Created by Przemysław Kapica on 04/04/2023.
//

import SwiftUI

struct AppView: View {
    @StateObject var viewModel = AppViewModel()
    
    var body: some View {
        Group {
            switch viewModel.appState {
                case .loading:
                    LoadingView()
                case .signedIn:
                    HomeView()
                case .signedOut:
                    LoginView()
            }
        }
        .transition(.slide)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
