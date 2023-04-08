//
//  UniversalButton.swift
//  TodoList
//
//  Created by Przemysław Kapica on 03/04/2023.
//

import SwiftUI

struct ButtonIcon {
    var image: UIImage?
    var placement: ButtonIconPlacement
    var preserveColor: Bool = false
}

enum ButtonIconPlacement {
    case left
    case right
}

struct UniversalButton: View {
    var title: String
    var disabled: Bool = false
    var icon: ButtonIcon? = nil
    var action: SimpleAction
    
    var body: some View {
        Button {
            action()
        } label: {
            buttonLabel
        }
        .frame(maxWidth: .infinity)
        .frame(height: 52)
        .font(.title3)
        .foregroundColor(.white)
        .background(disabled ? Color(.systemGray4) : .green)
        .disabled(disabled)
        .cornerRadius(16)
    }
    
    private var buttonLabel: some View {
        HStack {
            if let icon = icon, icon.placement == .left, icon.image != nil {
                Image(uiImage: icon.image!)
                    .resizable()
                    .renderingMode(icon.preserveColor ? .original : .template)
                    .foregroundColor(.white)
                    .frame(width: 20, height: 20)
                    
            }
            Text(title)
            
            if let icon = icon, icon.placement == .right, icon.image != nil {
                Image(uiImage: icon.image!)
                    .resizable()
                    .renderingMode(icon.preserveColor ? .original : .template)
                    .foregroundColor(.white)
                    .frame(width: 20, height: 20)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct UniversalButton_Previews: PreviewProvider {
    static var previews: some View {
        UniversalButton(
            title: "Press me!",
            disabled: false,
            icon: ButtonIcon(
                image: UIImage(systemName: "apple.logo"),
                placement: .left
            )
        ) {
            
        }
    }
}
