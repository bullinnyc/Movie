//
//  BoxListView.swift
//  Movie
//
//  Created by Dmitry Kononchuk on 11.10.2021.
//

import SwiftUI

struct BoxListView: View {
    // MARK: - Property Wrappers
    @Environment(\.scenePhase) private var scenePhase
    
    @StateObject private var listViewModel = BoxListViewModel()
    
    @State private var isErrorDownloadData = false
    
    // MARK: - body Property
    var body: some View {
        NavigationView {
            List {
                ForEach(listViewModel.filmsByYear.map { $0.key }.sorted(), id: \.self) { year in
                    Section(header: SectionView(year: year)) {
                        ForEach(listViewModel.filmsByYear[year] ?? []) { itemViewModel in
                            NavigationLink(
                                destination: DetailFilmView(itemViewModel: itemViewModel)
                            ) {
                                RowView(itemViewModel: itemViewModel)
                            }
                            .listRowBackground(Color.blue.opacity(0.1))
                        }
                    }
                }
            }
            .navigationTitle("Фильмы")
        }
        .alert(isPresented: $isErrorDownloadData) {
            Alert(
                title: Text("Ошибка загрузки данных"),
                message: Text("Повторите попытку позже")
            )
        }
        .onAppear {
            getData()
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .active {
                getData()
            }
        }
    }
    
    // MARK: - Private Methods
    private func getData() {
        listViewModel.fetchBox { isError in
            isErrorDownloadData = isError
        }
    }
}

// MARK: - Preview Provider
struct BoxListView_Previews: PreviewProvider {
    static var previews: some View {
        BoxListView()
            .environment(\.colorScheme, .light)
    }
}
