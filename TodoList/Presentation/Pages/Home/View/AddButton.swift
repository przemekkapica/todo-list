//
//  AddButton.swift
//  TodoList
//
//  Created by Przemysław Kapica on 05/04/2023.
//

import SwiftUI

struct AddButton: View {
    var body: some View {
        Text("+")
            .foregroundColor(Color.white)
            .font(.largeTitle)
            .frame(width: 60, height: 60)
//            .padding(.all, 4)
            .background(Color.green)
            .cornerRadius(50)
            .padding()
            .shadow(
                color: Color.secondary.opacity(0.5),
                radius: 3,
                x: 3, y: 3)
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton()
    }
}