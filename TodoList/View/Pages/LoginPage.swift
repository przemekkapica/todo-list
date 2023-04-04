//
//  LoginPage.swift
//  TodoList
//
//  Created by Przemysław Kapica on 03/04/2023.
//

import SwiftUI

struct LoginPage: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text("Express TODO")
                .font(.largeTitle)
                
            UniversalButton(title: "Sign in with Google") {
             // TODO: add action here
            }
        }
        .padding(.horizontal, 16)
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
