//
//  CatSearchVM.swift
//  CatsLookup
//
//  Created by Sourav Maharana on 28/10/25.
//

import SwiftUI

@MainActor
final class SearchViewModel: ObservableObject {
    @Published var catsArray: [SearchCatDataModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    
    private let respository = CatSearchRepository()
    
    func search(for query: String) async {
        guard !query.isEmpty else {
            catsArray = []
            return
        }
        isLoading = true
        errorMessage = nil
        
        do {
            catsArray = try await respository.fetchCats(searchQuery: query)
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
