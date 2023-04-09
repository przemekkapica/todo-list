//
//  CreateTodoView.swift
//  TodoList
//
//  Created by Przemysław Kapica on 05/04/2023.
//

import SwiftUI

struct CreateTodoSheet: View {
    @StateObject var viewModel = CreateTodoViewModel()
    @State var description: String = ""
    @State var selectedPriority: TodoPriority = .low
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack(spacing: 4) {
            sheetTopIndicator
            VStack(alignment: .leading, spacing: 8) {
                UniversalTextField(
                    value: $description,
                    title: "Task description"
                )
                Text("Task priority")
                    .font(.callout)
                    .padding(.top, 16)
                PriorityPicker(selectedPriority: $selectedPriority)
                    .padding(.bottom, 36)

                UniversalButton(
                    title: "Create",
                    disabled: viewModel.isButtonDisabled(description: description)
                ) {
                    viewModel.createTodo(
                        description: description,
                        priority: selectedPriority
                    )
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 8)
    }
    
    let sheetTopIndicator: some View = Capsule()
        .fill(Color.secondary)
        .frame(width: 30, height: 3)
        .padding(10)
}

struct CreateTodoSheet_Previews: PreviewProvider {
    static var previews: some View {
        CreateTodoSheet(selectedPriority: .low)
    }
}
