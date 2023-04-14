//
//  FontExtension.swift
//  TodoList
//
//  Created by Przemysław Kapica on 14/04/2023.
//

import Foundation
import SwiftUI

extension Font {
    
    /// Create a font with the large title text style.
    public static var largeTitle: Font {
        return Font.custom("Montserrat-Regular", size: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize)
    }

    /// Create a font with the title text style.
    public static var title: Font {
        return Font.custom("Montserrat-Regular", size: UIFont.preferredFont(forTextStyle: .title1).pointSize)
    }
    
    /// Create a font with the title2 text style.
    public static var title2: Font {
        return Font.custom("Montserrat-Regular", size: UIFont.preferredFont(forTextStyle: .title2).pointSize)
    }
    
    /// Create a font with the title3 text style.
    public static var title3: Font {
        return Font.custom("Montserrat-Regular", size: UIFont.preferredFont(forTextStyle: .title3).pointSize)
    }

    /// Create a font with the headline text style.
    public static var headline: Font {
        return Font.custom("Montserrat-Regular", size: UIFont.preferredFont(forTextStyle: .headline).pointSize)
    }

    /// Create a font with the subheadline text style.
    public static var subheadline: Font {
        return Font.custom("Montserrat-Light", size: UIFont.preferredFont(forTextStyle: .subheadline).pointSize)
    }

    /// Create a font with the body text style.
    public static var body: Font {
           return Font.custom("Montserrat-Regular", size: UIFont.preferredFont(forTextStyle: .body).pointSize)
       }

    /// Create a font with the callout text style.
    public static var callout: Font {
           return Font.custom("Montserrat-Regular", size: UIFont.preferredFont(forTextStyle: .callout).pointSize)
       }

    /// Create a font with the footnote text style.
    public static var footnote: Font {
           return Font.custom("Montserrat-Regular", size: UIFont.preferredFont(forTextStyle: .footnote).pointSize)
       }

    /// Create a font with the caption text style.
    public static var caption: Font {
           return Font.custom("Montserrat-Regular", size: UIFont.preferredFont(forTextStyle: .caption1).pointSize)
       }

    public static func system(size: CGFloat, weight: Font.Weight = .regular, design: Font.Design = .default) -> Font {
        var font = "Montserrat-Regular"
        switch weight {
        case .bold: font = "Montserrat-Bold"
        case .heavy: font = "Montserrat-ExtraBold"
        case .light: font = "Montserrat-Light"
        case .medium: font = "Montserrat-Regular"
        case .semibold: font = "Montserrat-SemiBold"
        case .thin: font = "Montserrat-Light"
        case .ultraLight: font = "Montserrat-Light"
        default: break
        }
        return Font.custom(font, size: size)
    }
}
