//
//  HomePage.swift
//  TodoList
//
//  Created by Przemysław Kapica on 04/04/2023.
//

import SwiftUI
import GoogleSignIn

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                List {
                    ForEach(viewModel.todos, id: \.id) { todo in
                        Button {
                            viewModel.toggleTodo(todo: todo)
                        } label: {
                            HStack {
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
                        
                    }
                    .onDelete(perform: viewModel.deleteTodo)
                    .onMove { indexSet, index in
                        
                    }
                }
//                .padding(.top, 20)
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
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                }
                AddButton()
                    .sheet(
                        isPresented: $viewModel.bottomSheetPresented,
                        onDismiss: viewModel.fetchTodos, content: {
                            CreateTodoView()
                                .presentationDetents([.fraction(0.36)])})
                    .onTapGesture {
                        viewModel.bottomSheetPresented = true
                    }
            }
        }
        .onAppear(perform: viewModel.fetchTodos)
        
    }
    
    func mapPriorityToColor(priority: TodoPriority) -> Color {
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


struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
