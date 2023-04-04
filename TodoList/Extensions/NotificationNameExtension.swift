//
//  NotificationNameExtension.swift
//  TodoList
//
//  Created by Przemysław Kapica on 04/04/2023.
//

import Foundation

extension Notification.Name {
    static let signedIn = NSNotification.Name("SignedIn")
    static let signedOut = NSNotification.Name("SignedOut")
    static let loading = NSNotification.Name("Loading")
}
