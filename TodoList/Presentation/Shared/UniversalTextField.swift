//
//  UniversalTextField.swift
//  TodoList
//
//  Created by Przemysław Kapica on 05/04/2023.
//

import SwiftUI

struct UniversalTextField: View {
    var title: String
    @Binding var value: String
    
    var body: some View {
        TextField(title, text: $value)
            .font(.body)
            .padding(16)
            .background(Color.secondary.opacity(0.10))
            .cornerRadius(16)
            .frame(maxHeight: 52)
            .shadow(color: .gray, radius: 10)
    }
}

struct UniversalTextField_Previews: PreviewProvider {
    static var previews: some View {
        UniversalTextField(
            title: "Custom field",
            value: .constant("Preview"))
    }
}
