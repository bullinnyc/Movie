//
//  ImageLoader.swift
//  Movie
//
//  Created by Dmitry Kononchuk on 16.10.2021.
//

import UIKit

enum ImageStatus {
    case loaded
    case notLoaded
    
    var bool: Bool {
        switch self {
        case .loaded: return true
        default: return false
        }
    }
}

final class ImageLoader: ObservableObject {
    // MARK: - Property Wrappers
    @Published var image: [Bool: UIImage] = [:]
    
    // MARK: - Private Properties
    private let cache = TemporaryImageCache.shared
    
    // MARK: - Public Methods
    func loadImage(from url: String) {
        // Check image to cache
        if let cachedImage = cache[url] {
            image[ImageStatus.loaded.bool] = cachedImage
            print("Image from cache")
            return
        }
        
        NetworkManager.shared.fetchImageData(from: url) { result in
            switch result {
            case .success(let data):
                let uiImage = ImageManager.shared.getImageFromData(from: data)
                self.image[ImageStatus.loaded.bool] = uiImage
                self.cache[url] = uiImage
                print("Image loaded from URL")
            case .failure(let error):
                DispatchQueue.main.async {
                    self.image[ImageStatus.notLoaded.bool] = ImageManager.shared.getCoverImage("film.circle.fill")
                }
                print(error.rawValue)
            }
        }
    }
}
