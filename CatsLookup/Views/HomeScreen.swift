//
//  HomeScreen.swift
//  CatsLookup
//
//  Created by Sourav Maharana on 28/10/25.
//

import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("CatsLookUp")
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing, content: {
                    NavigationLink(destination: SearchScreenView()) {
                        Image(systemName: "magnifyingglass")
                    }
                })
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button(action: {}) {
                        Image(systemName: "globe")
                    }
                })
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button(action: {}) {
                        Image(systemName: "ellipsis")
                            .rotationEffect(.degrees(90))
                    }
                })
            }
            .navigationTitle("CatsLookUp")
        }
    }
}

#Preview {
    HomeScreenView()
}
