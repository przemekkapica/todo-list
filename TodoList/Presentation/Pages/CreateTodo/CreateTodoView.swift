//
//  CreateTodoView.swift
//  TodoList
//
//  Created by Przemysław Kapica on 05/04/2023.
//

import SwiftUI

struct CreateTodoView: View {
    @StateObject var viewModel = CreateTodoViewModel()
    @State var description: String = ""
    @State var selectedPriority: TodoPriority = .low
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack(spacing: 4) {
            sheetTopIndicator
            VStack(alignment: .leading, spacing: 8) {
                UniversalTextField(title: "Task description", value: $description)
                Text("Task priority")
                    .font(.callout)
                    .padding(.top, 16)
                PriorityPicker(selectedPriority: $selectedPriority)
                Spacer()
                UniversalButton(title: "Create") {
                    Task {
                        viewModel.createTodo(
                            description: description,
                            priority: selectedPriority)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
        .padding(.horizontal, 24)
    }
    
    let sheetTopIndicator: some View = Capsule()
        .fill(Color.secondary)
        .frame(width: 30, height: 3)
        .padding(10)
}

struct CreateTodoView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTodoView(selectedPriority: .low)
    }
}
