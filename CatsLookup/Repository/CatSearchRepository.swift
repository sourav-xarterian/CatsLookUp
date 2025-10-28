//
//  CatSearchRepository.swift
//  CatsLookup
//
//  Created by Sourav Maharana on 28/10/25.
//

import Foundation

final class CatSearchRepository {
    func fetchCats(searchQuery: String) async throws -> [SearchCatDataModel] {
        let urlString = "https://api.thecatapi.com/v1/breeds/search?q=\(searchQuery)&attach_image=1"
        return try await APIService.sharedClient.get(urlString, responseType: [SearchCatDataModel].self)
    }
}
