//
//  SearchService.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 9.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

protocol SearchServiceProtocol {
    func getSearchResults(for query: String) async throws -> SearchResponseModel
}

final class SearchService: SearchServiceProtocol, BaseServiceProtocol {
    typealias Endpoint = SearchEndpoint
    let networkLoader: NetworkLoaderProtocol
    init(networkLoader: NetworkLoaderProtocol = NetworkLoaderProvider.shared.networkLoader) {
        self.networkLoader = networkLoader
    }
    func getSearchResults(for query: String) async throws -> SearchResponseModel {
        let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let searchQuery = "&query=\(encodedQuery)"
        return try await request(with: RequestObject(
            url: build(endpoint: .search),
            searchQuery: searchQuery
            ),
            responseModel: SearchResponseModel.self)
    }
}
