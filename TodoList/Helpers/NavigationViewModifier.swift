//
//  NavigationViewModifier.swift
//  TodoList
//
//  Created by Przemysław Kapica on 14/04/2023.
//

import Foundation
import SwiftUI

struct NavigationViewFont: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Montserrat-Bold", size: 20))
    }
}
