//
//  PriorityView.swift
//  CRUDSwiftPlayground
//
//  Created by Rivaldo Fernandes on 17/04/22.
//

import Foundation
import SwiftUI

struct PriorityPicker: View {
    @Binding var selectedPriority: TodoPriority
    
    var body: some View {
        HStack {
            PriorityView(
                priorityTitle: TodoPriority.low.rawValue.capitalized,
                selectedPriority: $selectedPriority)
            .onTapGesture {
                self.selectedPriority = .low
            }
            PriorityView(
                priorityTitle: TodoPriority.normal.rawValue.capitalized,
                selectedPriority: $selectedPriority)
            .onTapGesture {
                self.selectedPriority = .normal
            }
            PriorityView(
                priorityTitle: TodoPriority.high.rawValue.capitalized,
                selectedPriority: $selectedPriority)
            .onTapGesture {
                self.selectedPriority = .high
            }
        }
    }
}

struct PriorityView: View {
    let priorityTitle : String
    
    @Binding var selectedPriority: TodoPriority
    
    var body: some View {
        Text(priorityTitle)
            .font(.headline)
            .foregroundColor(.white)
            .padding(10)
            .background(selectedPriority.rawValue == priorityTitle.lowercased() ? mapPriorityToColor(priority: selectedPriority) : Color(.systemGray4))
            .cornerRadius(10)
    }
    
    func mapPriorityToColor(priority: TodoPriority) -> Color {
        switch(priority) {
        case .low:
            return .green
        case .normal:
            return .yellow
        case .high:
            return .red
        }
    }
}

struct PriorityView_Previews: PreviewProvider {
    static var previews: some View {
        PriorityPicker(selectedPriority: .constant(.high))
    }
}
