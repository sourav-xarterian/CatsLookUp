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
        }
    }
}

#Preview {
    HomeScreenView()
}
