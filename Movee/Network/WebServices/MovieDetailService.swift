//
//  MovieDetailService.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 27.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

protocol MovieDetailServiceProtocol {
    func getMovieDetails(for movieID: Int) async throws -> MovieDetailResponseModel
    func getCast(of movieID: Int) async throws -> CastResponseModel
}

final class MovieDetailService: MovieDetailServiceProtocol, BaseServiceProtocol {
    typealias Endpoint = MovieDetailEndpoints
    let networkLoader: NetworkLoaderProtocol
    init(networkLoader: NetworkLoaderProtocol = NetworkLoaderProvider.shared.networkLoader) {
        self.networkLoader = networkLoader
    }
    func getMovieDetails(for movieID: Int) async throws -> MovieDetailResponseModel {
        try await request(with: RequestObject(url: build(endpoint: .movieDetail(movieID: movieID))),
                responseModel: MovieDetailResponseModel.self)
    }
    func getCast(of movieID: Int) async throws -> CastResponseModel {
        try await request(with: RequestObject(url: build(endpoint: .cast(movieID: movieID))),
                          responseModel: CastResponseModel.self)
    }
}
