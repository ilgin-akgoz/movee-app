//
//  SearchViewModel.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 9.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

@MainActor
class SearchViewModel: ObservableObject {
    @Published var searchQuery = ""
    @Published var searchResults: [SearchDataModel] = []
    private let searchService: SearchServiceProtocol
    init(searchService: SearchServiceProtocol = SearchService()) {
        self.searchService = searchService
    }
    private func model(from results: [SearchResultsResponseModel]) -> [SearchDataModel] {
        return results.map { result in
            let mediaType = MediaType(rawValue: result.mediaType!) ?? .movie
            let mediaTypeIcon: String
            let imagePath: String
            let title: String
            let mediaTypeText: String
            switch mediaType {
            case .movie:
                title = result.title ?? ""
                imagePath = result.posterPath ?? ""
                mediaTypeIcon = "movieIcon"
                mediaTypeText = "search.mediaType.movie"
            case .tvSeries:
                title = result.title ?? ""
                imagePath = result.posterPath ?? ""
                mediaTypeIcon = "tvIcon"
                mediaTypeText = "search.mediaType.tv"
            case .person:
                title = result.name ?? ""
                imagePath = result.profilePath ?? ""
                mediaTypeIcon = "personIcon"
                mediaTypeText = "search.mediaType.actor"
            }
            return SearchDataModel(
                id: result.id ?? 0,
                title: title,
                overview: result.overview ?? "",
                imagePath: imagePath,
                mediaType: mediaType,
                mediaTypeIcon: mediaTypeIcon,
                mediaTypeText: mediaTypeText
            )
        }
    }
    func fetchResults() async {
        do {
            let searchResults = try await fetchSearchResults()
            self.searchResults = model(from: searchResults)
        } catch {
            print("\(error)")
        }
    }
    private func fetchSearchResults() async throws -> [SearchResultsResponseModel] {
        let response = try await searchService.getSearchResults(for: searchQuery)
        return response.results
    }
    func loadResults(for newQuery: String) {
        if newQuery.count >= 3 {
            Task {
                await fetchResults()
            }
        } else {
            searchResults = []
        }
    }
}
