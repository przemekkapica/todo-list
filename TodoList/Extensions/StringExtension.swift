//
//  StringExtension.swift
//  TodoList
//
//  Created by Przemysław Kapica on 08/04/2023.
//

import Foundation

extension String {
    func trim() -> String {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
}
