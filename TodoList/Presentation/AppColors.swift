//
//  AppColors.swift
//  TodoList
//
//  Created by Przemysław Kapica on 06/04/2023.
//

import Foundation
import UIKit

class AppColors: UIColor {

    override class var systemBackground: UIColor {
        return UIColor(named: "Background") ?? .systemBackground
    }

}
