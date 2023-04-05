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
                        Text("\(todo.title)")
                            .font(.body)
                            .strikethrough(todo.done)
                            .foregroundColor(todo.done ? Color.secondary : Color.primary)
                    }.onDelete { indexSet in
                        
                    }
                    .onMove { indexSet, index in
                        
                    }
                }
                .padding(.top, 20)
                .listStyle(.plain)
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
                NavigationLink {
                    CreateTodoView()
                } label: {
                    AddButton()
                }
            }
            .onAppear(perform: viewModel.fetchTodos)
        }
    }
}


struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
