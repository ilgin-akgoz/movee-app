//
//  MoviesViewModel.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 26.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

class MoviesViewModel: ObservableObject {
    @Published var nowPlayingMovies: [MovieResponseModel] = []
    @Published var popularMovies: [MovieResponseModel] = []
    @Published var movieGenres: [MovieGenreItemResponseModel] = []
    private let movieService: MovieServiceProtocol
    init(movieService: MovieServiceProtocol = MovieService()) {
        self.movieService = movieService
    }
    func fetchMovies() async {
        do {
            let nowPlayingMovies = try await fetchNowPlayingMovies()
            let popularMovies = try await fetchPopularMovies()
            let movieGenres = try await fetchMovieGenres()
            DispatchQueue.main.async {
                self.nowPlayingMovies = nowPlayingMovies
                self.popularMovies = popularMovies
                self.movieGenres = movieGenres
            }
        } catch {
            print("\(error)")
        }
    }
    private func fetchNowPlayingMovies() async throws -> [MovieResponseModel] {
        let response = try await movieService.getNowPlayingMovies()
        return response.movies
    }
    private func fetchPopularMovies() async throws -> [MovieResponseModel] {
        let response = try await movieService.getPopularMovies()
        return response.movies
    }
    private func fetchMovieGenres() async throws -> [MovieGenreItemResponseModel] {
        let response = try await movieService.getMovieGenres()
        return response.genres
    }
    func getGenreNames(movie: MovieResponseModel, genres: [MovieGenreItemResponseModel]) -> [String] {
        let genreNames = genres.filter { movie.genreIDs.contains($0.genreID) }.map { $0.name }
        return genreNames
    }
}
