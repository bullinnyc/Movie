//
//  ForegroundColor.swift
//  Movie
//
//  Created by Dmitry Kononchuk on 12.10.2021.
//

import SwiftUI

struct ForegroundColor: ViewModifier {
    // MARK: - Public Properties
    let number: Double
    
    // MARK: - body Method
    func body(content: Content) -> some View {
        switch number {
        case ..<5: content.foregroundColor(Color(hex: "#ff0b0b"))
        case 5..<7: content.foregroundColor(Color(hex: "#5f5f5f"))
        default: content.foregroundColor(Color(hex: "#007b00"))
        }
    }
}

// MARK: - Ext. View
extension View {
    func foregroundColor(_ number: Double) -> some View {
        modifier(ForegroundColor(number: number))
    }
}
