//
//  AlertToast.swift
//  TodoList
//
//  Created by Przemysław Kapica on 07/04/2023.
//

import SwiftUI
import AlertToast

func errorToast(title: String = "Something went wrong") -> AlertToast {
    return AlertToast(
        displayMode: .hud,
        type: .error(.red),
        title: title
    )
}

func successToast(title: String = "OK") -> AlertToast {
    return AlertToast(
        displayMode: .alert,
        type: .complete(.green),
        title: title
    )
}

