//
//  BoxListViewModel.swift
//  Movie
//
//  Created by Dmitry Kononchuk on 11.10.2021.
//

import Foundation

class BoxListViewModel: ObservableObject {
    // MARK: - Property Wrappers
    @Published var films: [FilmViewModel] = []
    
    // MARK: - Public Property
    var filmsByYear: [Int: [FilmViewModel]] {
        var filmsByYear: [Int: [FilmViewModel]] = [:]
        let years = Set(films.map { $0.year })
        
        for year in years {
            let filmsByYearFilter = films.filter { $0.year == year }
            filmsByYear[year] = filmsByYearFilter
        }
        return filmsByYear
    }
    
    // MARK: - Public Methods
    func fetchBox(completion: @escaping (Bool) -> Void) {
        NetworkManager.shared.fetchData(from: JsonURL.box.rawValue) { result in
            switch result {
            case .success(let box):
                let boxViewModel = BoxViewModel(box: box)
                self.films = boxViewModel.films
                completion(false)
            case .failure(let error):
                print(error.rawValue)
                completion(true)
            }
        }
    }
}
