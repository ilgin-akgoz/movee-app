//
//  MovieDetailViewModel.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 27.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

@MainActor
class MovieDetailViewModel: ObservableObject {
    @Published var movieDetails: MovieDetailResponseModel?
    @Published var cast: [ActorResponseModel] = []
    private let movieID: Int
    private let movieDetailService: MovieDetailServiceProtocol
    init(movieDetailService: MovieDetailServiceProtocol = MovieDetailService(),
         movieID: Int
         ) {
        self.movieDetailService = movieDetailService
        self.movieID = movieID
    }
    func fetchMovie() async {
        do {
            let movieDetails = try await fetchMovieDetails()
            let cast = try await fetchCast()
            self.movieDetails = movieDetails
            self.cast = cast
        } catch {
            print("\(error)")
        }
    }
    private func fetchMovieDetails() async throws -> MovieDetailResponseModel {
        try await movieDetailService.getMovieDetails(for: movieID)
    }
    private func fetchCast() async throws -> [ActorResponseModel] {
        let response = try await movieDetailService.getCast(of: movieID)
        return response.cast
    }
}
