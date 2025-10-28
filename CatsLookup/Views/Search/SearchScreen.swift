//
//  SearchScreen.swift
//  CatsLookup
//
//  Created by Sourav Maharana on 28/10/25.
//

import SwiftUI

struct SearchScreenView: View {
    @State private var searchString: String = ""
    @StateObject private var searchViewModel = SearchViewModel()
    
    var body: some View {
        VStack {
            // Search Field
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Start Typing To Get Started...", text: $searchString)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onChange(of: searchString) { oldValue, newValue in
                        Task {
                            await searchViewModel.search(for: newValue)
                        }
                    }
            }
            
            // Data / Loader / Empty & Error State
            VStack {
                if(!searchString.isEmpty) {
                    if(searchViewModel.isLoading) {
                        ProgressView(value: 0.5, total: 1.0) {
                               Text("Loading…")
                           }
                           .progressViewStyle(.circular)
                           .tint(.blue)
                           .frame(maxWidth: .infinity, maxHeight: .infinity)
                           .padding()
                    } else if(!searchViewModel.isLoading && searchViewModel.catsArray.isEmpty) {
                        Text("No Search Results Found for \(searchString)!")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    } else {
                        List(searchViewModel.catsArray) { cat in
                            FavouriteCatCard(cat: cat)
                                .padding(.vertical, 4)
                        }
                        .listStyle(.plain)
                    }
                } else {
                    Text("Start typing to search for your favourite fur!")
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                       
                }
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
        
    }
}

#Preview {
    SearchScreenView()
}
