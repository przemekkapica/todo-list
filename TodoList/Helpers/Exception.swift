//
//  Exception.swift
//  TodoList
//
//  Created by Przemysław Kapica on 04/04/2023.
//

import Foundation

enum Exception: Error {
    case auth(String?)
    case unknown
}
