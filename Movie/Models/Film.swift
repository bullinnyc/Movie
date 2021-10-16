//
//  Models.swift
//  Movie
//
//  Created by Dmitry Kononchuk on 11.10.2021.
//

import Foundation

// MARK: - Film
struct Film: Decodable {
    // MARK: - Public Properties
    let id: Int
    let localizedName: String
    let name: String
    let year: Int
    let rating: Double?
    let imageUrl: String?
    let description: String?
    let genres: [String]
}

// MARK: - Ext. Film
extension Film {
    static func getFilm() -> Film {
        Film(
            id: 447301,
            localizedName: "Начало",
            name: "Inception",
            year: 2010,
            rating: 8.767,
            imageUrl: "https://upload.wikimedia.org/wikipedia/ru/b/bc/Poster_Inception_film_2010.jpg",
            description: """
            Кобб — талантливый вор, лучший из лучших в опасном искусстве извлечения: он крадет ценные секреты из глубин подсознания во время сна, когда человеческий разум наиболее уязвим. Редкие способности Кобба сделали его ценным игроком в привычном к предательству мире промышленного шпионажа, но они же превратили его в извечного беглеца и лишили всего, что он когда-либо любил. И вот у Кобба появляется шанс исправить ошибки. Его последнее дело может вернуть все назад, но для этого ему нужно совершить невозможное — инициацию. Вместо идеальной кражи Кобб и его команда спецов должны будут провернуть обратное. Теперь их задача — не украсть идею, а внедрить ее. Если у них получится, это и станет идеальным преступлением. Но никакое планирование или мастерство не могут подготовить команду к встрече с опасным противником, который, кажется, предугадывает каждый их ход. Врагом, увидеть которого мог бы лишь Кобб.
            """,
            genres: ["фантастика", "боевик", "триллер", "драма", "детектив"]
        )
    }
}
