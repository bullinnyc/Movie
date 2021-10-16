//
//  ImageManager.swift
//  Movie
//
//  Created by Dmitry Kononchuk on 16.10.2021.
//

import UIKit

class ImageManager {
    // MARK: - Public Properties
    static let shared = ImageManager()
    
    // MARK: - Private Initializers
    private init() {}
    
    // MARK: - Public Methods
    func getImageFromData(from data: Data?) -> UIImage {
        guard let data = data, let image = UIImage(data: data) else { return UIImage() }
        return image
    }
    
    func getCoverImage(_ named: String) -> UIImage {
        let configuration = UIImage.SymbolConfiguration(pointSize: UIScreen.main.bounds.width * 0.5)
        guard let image = UIImage(systemName: named, withConfiguration: configuration) else { return UIImage() }
        return image
    }
}
