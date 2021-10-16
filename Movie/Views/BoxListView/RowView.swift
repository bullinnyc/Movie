//
//  RowView.swift
//  Movie
//
//  Created by Dmitry Kononchuk on 11.10.2021.
//

import SwiftUI

struct RowView: View {
    // MARK: - Public Properties
    let itemViewModel: FilmViewModel
    
    // MARK: - body Property
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 8) {
                Text(itemViewModel.localizedName)
                
                Text(itemViewModel.name)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Text(Formatter.fractionDigits.string(
                for: itemViewModel.rating ?? 0
            ) ?? "")
                .foregroundColor(itemViewModel.rating ?? 0)
                .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4))
        }
        .font(.callout)
        .font(.custom("PingFangHK-Light", size: 16))
    }
}

// MARK: - Preview Provider
struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(itemViewModel: FilmViewModel(film: Film.getFilm()))
    }
}
