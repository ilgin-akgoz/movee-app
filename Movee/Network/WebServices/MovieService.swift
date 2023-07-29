//
//  MovieService.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 26.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

protocol MovieServiceProtocol {
    func getNowPlayingMovies() async throws -> NowPlayingMovieResponseModel
    func getPopularMovies() async throws -> PopularMovieResponseModel
    func getMovieGenres() async throws -> MovieGenreResponseModel
}

final class MovieService: MovieServiceProtocol, BaseServiceProtocol {
    typealias Endpoint = MovieEndpoints
    let networkLoader: NetworkLoaderProtocol
    init(networkLoader: NetworkLoaderProtocol = NetworkLoaderProvider.shared.networkLoader) {
        self.networkLoader = networkLoader
    }
    func getNowPlayingMovies() async throws -> NowPlayingMovieResponseModel {
        try await request(with: RequestObject(url: build(endpoint: .nowPlayingMovies)),
                responseModel: NowPlayingMovieResponseModel.self)
    }
    func getPopularMovies() async throws -> PopularMovieResponseModel {
        try await request(with: RequestObject(url: build(endpoint: .popularMovies)),
                responseModel: PopularMovieResponseModel.self)
    }
    func getMovieGenres() async throws -> MovieGenreResponseModel {
        try await request(with: RequestObject(url: build(endpoint: .movieGenre)),
                responseModel: MovieGenreResponseModel.self)
    }
}
