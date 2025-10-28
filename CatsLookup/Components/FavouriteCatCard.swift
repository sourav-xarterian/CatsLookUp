//
//  FavouriteCatCard.swift
//  CatsLookup
//
//  Created by Sourav Maharana on 28/10/25.
//

import SwiftUI

struct FavouriteCatCard: View {
    let cat: SearchCatDataModel
    @ObservedObject var favouriteCatsVm: FavouritesViewModel

    var isFavourite: Bool {
        favouriteCatsVm.contains(cat)
    }

    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            VStack(alignment: .leading, spacing: 8) {
                Text(cat.name)
                Text(cat.description)
                    .lineLimit(nil)
            }
            Button {
                favouriteCatsVm.toggleFavourite(cat)
            } label: {
                Image(systemName: isFavourite ? "heart.fill" : "heart")
                    .font(.system(size: 22))
                    .foregroundColor(isFavourite ? .red : .gray)
                    .padding(.trailing, 4)
            }
        }
        .padding(6)
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 150)) {
    FavouriteCatCard(
        cat: SearchCatDataModel(id: "1", name: "Fluffy", description: "Cute cat", wikipedia_url: nil),
        favouriteCatsVm: FavouritesViewModel()
    )
}
