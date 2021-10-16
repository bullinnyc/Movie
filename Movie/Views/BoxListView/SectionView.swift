//
//  SectionView.swift
//  Movie
//
//  Created by Dmitry Kononchuk on 12.10.2021.
//

import SwiftUI

struct SectionView: View {
    // MARK: - Public Property
    let year: Int
    
    // MARK: - body Property
    var body: some View {
        HStack {
            Spacer()
            Text(String(year))
            Spacer()
        }
        .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
    }
}

// MARK: - Preview Provider
struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(year: 2021)
    }
}
