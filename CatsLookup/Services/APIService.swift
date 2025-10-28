//
//  APIService.swift
//  CatsLookup
//
//  Created by Sourav Maharana on 28/10/25.
//

import Foundation
import Alamofire

final class APIService {
    static let sharedClient = APIService()
    
    private init() {}
    
    private let session: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        return Session(configuration: configuration)
    }()
    
    // GET
    func get<T: Decodable>(_ url: String, responseType: T.Type) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            session.request(url, method: .get)
                .validate()
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let value):
                        continuation.resume(returning: value)
                        
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
        }
    }
}
