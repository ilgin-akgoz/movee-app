//
//  MovieDetailViewModel.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 27.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    @Published var movieDetails: MovieDetailResponseModel?
    var movieID: Int
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
            DispatchQueue.main.async {
                self.movieDetails = movieDetails
            }
        } catch {
            print("\(error)")
        }
    }
    private func fetchMovieDetails() async throws -> MovieDetailResponseModel {
        try await movieDetailService.getMovieDetails(for: movieID)
    }
}
