//
//  CatSearchDataModel.swift
//  CatsLookup
//
//  Created by Sourav Maharana on 28/10/25.
//

import Foundation

struct SearchCatDataModel: Identifiable, Codable, Equatable {
    let id: String
    let name: String
    let description: String
    let wikipedia_url: String?
}

