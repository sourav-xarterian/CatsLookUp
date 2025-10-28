//
//  CatsLookupApp.swift
//  CatsLookup
//
//  Created by Sourav Maharana on 28/10/25.
//

import SwiftUI

@main
struct CatsLookupApp: App {
    @StateObject private var favouritesVM = FavouritesViewModel()
    var body: some Scene {
        WindowGroup {
            HomeScreenView()
                .environmentObject(favouritesVM)
        }
    }
}
