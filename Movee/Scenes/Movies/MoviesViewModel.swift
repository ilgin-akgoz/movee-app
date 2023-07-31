//
//  MoviesViewModel.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 26.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

class MoviesViewModel: ObservableObject {
    @Published var nowPlayingMovies: [MovieDataModel] = []
    @Published var popularMovies: [MovieDataModel] = []
    private let movieService: MovieServiceProtocol
    init(movieService: MovieServiceProtocol = MovieService()) {
        self.movieService = movieService
    }
    private func matchGenresForMovies(
        movies: [MovieResponseModel],
        genres: [MovieGenreItemResponseModel]
    ) -> [MovieDataModel] {
        return movies.map { movie in
            let genreNames = getGenreNames(movie: movie, genres: genres)
            return MovieDataModel(
                movieID: movie.movieID,
                title: movie.title,
                genres: genreNames,
                posterPath: movie.posterPath,
                voteAverage: movie.voteAverage,
                releaseDate: movie.releaseDate)
        }
    }
    func fetchMovies() async {
        do {
            let nowPlayingMovies = try await fetchNowPlayingMovies()
            let popularMovies = try await fetchPopularMovies()
            let movieGenres = try await fetchMovieGenres()
            DispatchQueue.main.async {
                self.nowPlayingMovies = self.matchGenresForMovies(movies: nowPlayingMovies, genres: movieGenres)
                self.popularMovies = self.matchGenresForMovies(movies: popularMovies, genres: movieGenres)
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
    private func getGenreNames(movie: MovieResponseModel, genres: [MovieGenreItemResponseModel]) -> [String] {
        let genreNames = genres.filter { movie.genreIDs.contains($0.genreID) }.map { $0.name }
        return genreNames
    }
}
