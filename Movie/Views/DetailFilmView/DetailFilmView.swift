//
//  DetailFilmView.swift
//  Movie
//
//  Created by Dmitry Kononchuk on 11.10.2021.
//

import SwiftUI

struct DetailFilmView: View {
    // MARK: - Public Properties
    let itemViewModel: FilmViewModel
    
    // MARK: - body Property
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()
            
            GeometryReader { geometry in
                let size = geometry.size
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 20) {
                        HStack(alignment: .top, spacing: 20) {
                            ImageView(url: itemViewModel.imageUrl ?? "")
                                .frame(
                                    width: UIWindow.isPortrait
                                    ? size.width * 0.45
                                    : size.width * 0.25,
                                    height: UIWindow.isPortrait
                                    ? size.width * 0.45
                                    : size.width * 0.25
                                )
                                .cornerRadius(15)
                                .shadow(color: .black.opacity(0.3), radius: 5, x: -2, y: -2)
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text(itemViewModel.name)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                
                                Text("Год: \(String(itemViewModel.year))")
                                
                                HStack {
                                    Text("Рейтинг:")
                                    
                                    Text(Formatter.fractionDigits.string(
                                        for: itemViewModel.rating ?? 0
                                    ) ?? "")
                                        .foregroundColor(itemViewModel.rating ?? 0)
                                }
                            }
                            .font(.footnote)
                        }
                        
                        Divider()
                        
                        Text(itemViewModel.description ?? "")
                    }
                    .font(.custom("PingFangHK-Light", size: 16))
                    .padding()
                }
            }
            .navigationTitle(itemViewModel.localizedName)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Preview Provider
struct DetailFilmView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailFilmView(itemViewModel: FilmViewModel(film: Film.getFilm()))
        }
    }
}
