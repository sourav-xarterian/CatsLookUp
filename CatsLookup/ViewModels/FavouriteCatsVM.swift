//
//  FavouriteCatsVM.swift
//  CatsLookup
//
//  Created by Sourav Maharana on 28/10/25.
//

import Foundation
import SwiftUI

class FavouritesViewModel: ObservableObject {
    @Published private(set) var favourites: [SearchCatDataModel] = []
    private let saveKey = "favouriteCats"

    init() {
        loadFavourites()
    }

    func contains(_ cat: SearchCatDataModel) -> Bool {
        favourites.contains(where: { $0.id == cat.id })
    }

    func add(_ cat: SearchCatDataModel) {
        guard !contains(cat) else { return }
        favourites.append(cat)
        saveFavourites()
    }

    func remove(_ cat: SearchCatDataModel) {
        if let idx = favourites.firstIndex(where: { $0.id == cat.id }) {
            favourites.remove(at: idx)
            saveFavourites()
        }
    }

    func toggleFavourite(_ cat: SearchCatDataModel) {
        contains(cat) ? remove(cat) : add(cat)
    }

    private func saveFavourites() {
        guard let data = try? JSONEncoder().encode(favourites) else { return }
        UserDefaults.standard.set(data, forKey: saveKey)
    }

    private func loadFavourites() {
        guard
            let data = UserDefaults.standard.data(forKey: saveKey),
            let decoded = try? JSONDecoder().decode([SearchCatDataModel].self, from: data)
        else {
            favourites = []
            return
        }
        favourites = decoded
    }
}
