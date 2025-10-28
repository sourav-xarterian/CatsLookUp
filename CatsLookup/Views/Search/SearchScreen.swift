//
//  SearchScreen.swift
//  CatsLookup
//
//  Created by Sourav Maharana on 28/10/25.
//

import SwiftUI

struct SearchScreenView: View {
    @State private var searchString: String = ""
    
    var body: some View {
        VStack {
            // Search Field
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Start Typing To Get Started...", text: $searchString)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            // Data / Loader / Empty & Error State
            VStack {
                Text("No Search Results Found for \(searchString)!")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
        
    }
}

#Preview {
    SearchScreenView()
}
