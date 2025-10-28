//
//  FavouriteCatCard.swift
//  CatsLookup
//
//  Created by Sourav Maharana on 28/10/25.
//

import SwiftUI

struct FavouriteCatCard: View {
    let cat: SearchCatDataModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            VStack(alignment: .leading, spacing: 8) {
                Text(cat.name)
                Text(cat.description)
                    .lineLimit(nil)
            }
            Image(systemName: "heart")
                .font(.system(size: 22))
                .padding(.trailing, 4)
        }
        .padding(6)
    }
}

#Preview(traits: .fixedLayout(width: 400, height:  150)) {
    FavouriteCatCard(cat: SearchCatDataModel(id: "", name: "", description: "", wikipedia_url: ""))
}
