//
//  UniversalButton.swift
//  TodoList
//
//  Created by Przemysław Kapica on 03/04/2023.
//

import SwiftUI

struct UniversalButton: View {
    var title: String
    var disabled: Bool = false
    var action: SimpleAction
    
    var body: some View {
        Button {
            action()
        } label: {
            buttonLabel
        }
        .disabled(disabled)
    }
    
    private var buttonLabel: some View {
        Text(title)
            .font(.title3)
            .foregroundColor(Color.white)
            .frame(height: 52)
            .frame(maxWidth: .infinity)
            .background(disabled ? Color(.systemGray4) : Color.green)
            .cornerRadius(16)
    }
}

struct UniversalButton_Previews: PreviewProvider {
    static var previews: some View {
        UniversalButton(title: "Press me", disabled: true) {
            
        }
    }
}
