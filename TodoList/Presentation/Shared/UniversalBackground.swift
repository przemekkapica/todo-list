//
//  UniversalBackground.swift
//  TodoList
//
//  Created by Przemysław Kapica on 08/04/2023.
//

import SwiftUI

struct UniversalBackground: View {
    var body: some View {
        Color(uiColor: UIColor(named: "Background") ?? .systemBackground).edgesIgnoringSafeArea(.all)
    }
}

struct UniversalBackground_Previews: PreviewProvider {
    static var previews: some View {
        UniversalBackground()
    }
}
