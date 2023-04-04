//
//  UserInfo.swift
//  TodoList
//
//  Created by Przemysław Kapica on 04/04/2023.
//

import Foundation

struct UserInfo: Codable {
    var email: String
    var name: String?
    var photoUrl: URL?
    var uid: String?
}
