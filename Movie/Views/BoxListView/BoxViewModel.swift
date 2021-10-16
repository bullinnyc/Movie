//
//  BoxViewModel.swift
//  Movie
//
//  Created by Dmitry Kononchuk on 12.10.2021.
//

import Foundation

class BoxViewModel {
    // MARK: - Public Properties
    var films: [FilmViewModel] = []
    
    // MARK: - Private Properties
    private let box: Box
    
    // MARK: - Initializers
    init(box: Box) {
        self.box = box
        films = box.films.map { FilmViewModel(film: $0) }
    }
}
