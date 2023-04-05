//
//  CreateTodoView.swift
//  TodoList
//
//  Created by Przemysław Kapica on 05/04/2023.
//

import SwiftUI

struct CreateTodoView: View {
    @StateObject var viewModel = CreateTodoViewModel()
    @State var title: String = ""
    @State var notes: String = ""
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack(spacing: 16) {
            UniversalTextField(title: "Title", value: $title)
            UniversalTextField(title: "Notes", value: $notes)
            Spacer()
            UniversalButton(title: "Create TODO") {
                Task {
                    viewModel.createTodo(title: title, notes: notes)
                    presentationMode.wrappedValue.dismiss()                    
                }
            }
        }
        .padding(.horizontal, 24)
    }
}

struct CreateTodoView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTodoView()
    }
}
