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
        VStack(alignment: .leading, spacing: 16) {
            UniversalTextField(title: "Task description", value: $description)
            Text("Task priority")
                .font(.title3)
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
        .padding(.top, 24)
        .padding(.horizontal, 24)
    }
}

struct CreateTodoView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTodoView(selectedPriority: .low)
    }
}
