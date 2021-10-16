//
//  Extension + Formatter.swift
//  Movie
//
//  Created by Dmitry Kononchuk on 12.10.2021.
//

import Foundation

extension Formatter {
    // MARK: - Public Properties
    static let fractionDigits: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 3
        return formatter
    }()
}
