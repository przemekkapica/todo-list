import Foundation
import SwiftUI

struct TodoRow: View {
    var todo: Todo
    
    var body: some View {
        Button {
            viewModel.toggleTodo(todo: todo)
        } label: {
            Text("\(todo.title)")
                .font(.body)
                .strikethrough(todo.done)
                .foregroundColor(todo.done ? Color.secondary : Color.primary)
        }
    }
}


// you may remove this preview or update
struct todoListRow_Previews: PreviewProvider {
    static var previews: some View {
        TodoRow()
    }
}
