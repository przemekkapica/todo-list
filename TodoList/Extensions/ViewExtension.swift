//
//  ViewExtension.swift
//  TodoList
//
//  Created by Przemysław Kapica on 14/04/2023.
//

import Foundation
import SwiftUI

extension View {
    func navigationViewFont() -> some View {
        modifier(NavigationViewFont())
    }
}
