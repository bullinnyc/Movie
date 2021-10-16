//
//  ImageView.swift
//  Movie
//
//  Created by Dmitry Kononchuk on 14.10.2021.
//

import SwiftUI

struct ImageView: View {
    // MARK: - Property Wrappers
    @StateObject private var imageLoader = ImageLoader()
    
    @State private var image = UIImage()
    @State private var isCoverImage = false
    @State private var isShowProgressView = true
    
    // MARK: - Public Properties
    let url: String
    
    // MARK: - body Property
    var body: some View {
        ZStack {
            if isShowProgressView {
                ProgressView()
            }
            
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .opacity(isCoverImage ? 0.15 : 1)
        }
        .onReceive(imageLoader.$image) { image in
            if !image.isEmpty {
                isCoverImage = !(image.first?.key ?? false)
                self.image = image.first?.value ?? UIImage()
                isShowProgressView.toggle()
            }
        }
        .onAppear {
            imageLoader.loadImage(from: url)
        }
    }
}

// MARK: - Preview Provider
struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: "https://upload.wikimedia.org/wikipedia/ru/b/bc/Poster_Inception_film_2010.jpg")
    }
}
