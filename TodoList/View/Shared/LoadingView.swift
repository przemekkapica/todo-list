//
//  LoadingScreen.swift
//  TodoList
//
//  Created by Przemysław Kapica on 04/04/2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
//            Color.background(Color.white).edgesIgnoringSafeArea(.all)
            
            ProgressView()
                .scaleEffect(x: 2, y: 2, anchor: .center)
        }
    }
}

struct LoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
