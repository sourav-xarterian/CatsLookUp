//
//  HomeScreen.swift
//  CatsLookup
//
//  Created by Sourav Maharana on 28/10/25.
//

import SwiftUI

struct HomeScreenView: View {
    @State var showLanguageDialog: Bool = false
    @State var showThemeDialog: Bool = false
    @EnvironmentObject var favouritesVM: FavouritesViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                if favouritesVM.favourites.isEmpty {
                    Text("No Liked Cats here!")
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        .foregroundColor(.secondary)
                        .padding()
                } else {
                    List(favouritesVM.favourites) { cat in
                        FavouriteCatCard(cat: cat, favouriteCatsVm: favouritesVM)
                            .padding(.vertical, 4)
                    }
                    .listStyle(.plain)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing, content: {
                    NavigationLink(destination: SearchScreenView()) {
                        Image(systemName: "magnifyingglass")
                    }
                })
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button(action: { showLanguageDialog = true }) {
                        Image(systemName: "globe")
                    }
                    .confirmationDialog("Select Language", isPresented: $showLanguageDialog) {
                        Button("English") {}
                        Divider()
                        Button("Hindi") {}
                    }
                })
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button(action: { showThemeDialog = true }) {
                        Image(systemName: "ellipsis")
                            .rotationEffect(.degrees(90))
                    }
                    .confirmationDialog("Select Theme", isPresented: $showThemeDialog) {
                        Button("Dark Mode") {}
                        Divider()
                        Button("Light mode") {}
                        Divider()
                        Button("System") {}
                    }
                })
            }
            .navigationTitle("CatsLookUp")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    HomeScreenView().environmentObject(FavouritesViewModel())
}
