//
//  FavouriteCatCard.swift
//  CatsLookup
//
//  Created by Sourav Maharana on 28/10/25.
//

import SwiftUI

struct FavouriteCatCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Cat Name Goes here")
            Text("Cat Description: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
                .lineLimit(nil)
        }
        .padding(6)
    }
}

#Preview(traits: .fixedLayout(width: 400, height:  120)) {
    FavouriteCatCard()
}
