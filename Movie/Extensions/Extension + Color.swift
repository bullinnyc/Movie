//
//  Extension + Color.swift
//  Movie
//
//  Created by Dmitry Kononchuk on 12.10.2021.
//

import SwiftUI

extension Color {
    // MARK: - Initializers
    init(hex: String, alpha: Double = 1) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var hexInt: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&hexInt)
        
        self.init(
            .sRGB,
            red: Double((hexInt >> 16) & 0xff) / 255,
            green: Double((hexInt >> 08) & 0xff) / 255,
            blue: Double((hexInt >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
