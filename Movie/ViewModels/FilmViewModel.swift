//
//  FilmViewModel.swift
//  Movie
//
//  Created by Dmitry Kononchuk on 11.10.2021.
//

import Foundation

class FilmViewModel: Identifiable {
    // MARK: - Public Properties
    var id: Int {
        film.id
    }
    var localizedName: String {
        film.localizedName
    }
    var name: String {
        film.name
    }
    var year: Int {
        film.year
    }
    var rating: Double? {
        film.rating
    }
    var imageUrl: String? {
        film.imageUrl
    }
    var description: String? {
        film.description
    }
    var genres: [String] {
        film.genres
    }
    
    // MARK: - Private Properties
    private let film: Film
    
    // MARK: - Initializers
    init(film: Film) {
        self.film = film
    }
}
