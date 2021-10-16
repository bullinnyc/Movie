//
//  Extension + UIWindow.swift
//  Movie
//
//  Created by Dmitry Kononchuk on 12.10.2021.
//

import UIKit

extension UIWindow {
    // MARK: - Public Properties
    static var isPortrait: Bool {
        return UIApplication.shared.connectedScenes
            .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
            .first?
            .windowScene?
            .interfaceOrientation.isPortrait ?? false
    }
}
