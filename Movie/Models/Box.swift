//
//  Box.swift
//  Movie
//
//  Created by Dmitry Kononchuk on 12.10.2021.
//

import Foundation

enum JsonURL: String {
    case box = "https://s3-eu-west-1.amazonaws.com/sequeniatesttask/films.json"
}

struct Box: Decodable {
    // MARK: - Public Properties
    let films: [Film]
}
