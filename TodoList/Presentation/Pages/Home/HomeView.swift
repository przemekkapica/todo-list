//
//  HomePage.swift
//  TodoList
//
//  Created by Przemysław Kapica on 04/04/2023.
//

import SwiftUI
import GoogleSignIn
import UIKit
import AlertToast

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                UniversalBackground()
                
                TodoList(viewModel: viewModel)
                
                AddTodoButton(viewModel: viewModel)
            }
            .toast(isPresenting: $viewModel.showErrorToast) {
                errorToast()
            }
        }
        .onAppear(perform: viewModel.fetchTodos)
    }
}

struct TodoList: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        ZStack {
            if viewModel.todos.isEmpty {
                Text("Well done! There are no tasks")
                    .foregroundColor(.secondary)
            }
            List {
                ForEach(viewModel.todos, id: \.id) { todo in
                    Button {
                        viewModel.toggleTodo(todo: todo)
                    } label: {
                        todoEntry(todo: todo)
                    }
                }
                .onDelete(perform: viewModel.deleteTodo)
            }
            .scrollDisabled(viewModel.todos.isEmpty)
            .listStyle(.sidebar)
            .navigationTitle("Your TODOs")
            .toolbar {
                ToolbarItem {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        Image(systemName: "person.crop.circle")
                            .foregroundColor(Color.primary)
                    }
                }
                if !viewModel.todos.isEmpty {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                }
        }
        }
    }
    
    private func todoEntry(todo: Todo) -> some View {
        return HStack {
            Text("\(todo.description)")
                .font(.body)
                .strikethrough(todo.done)
                .foregroundColor(todo.done ? Color.secondary : Color.primary)
            Spacer()
            if !todo.done {
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(mapPriorityToColor(priority: todo.priority))
            }
        }
    }
    
    private func mapPriorityToColor(priority: TodoPriority) -> Color {
        switch(priority) {
        case TodoPriority.low:
            return Color.green
        case TodoPriority.normal:
            return Color.yellow
        case TodoPriority.high:
            return Color.red
        }
    }
}

struct AddTodoButton: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        AddButton(action: {
            viewModel.bottomSheetPresented = true
        })
        .sheet(
            isPresented: $viewModel.bottomSheetPresented,
            onDismiss: viewModel.fetchTodos,
            content: {
                CreateTodoSheet()
                    .presentationDetents([.fraction(0.36)])
            })
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
