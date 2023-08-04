//
//  TvSeriesService.swift
//  Movee
//
//  Created by Hakan Tekir on 1.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

protocol TvSeriesServiceProtocol {
    func getPopularSeries() async throws -> PopularSeriesResponseModel
    func getTopRatedSeries() async throws -> TopRatedSeriesResponseModel
    func getSeriesGenres() async throws -> TvSeriesGenreResponseModel
}

final class TvSeriesService: TvSeriesServiceProtocol, BaseServiceProtocol {
    typealias Endpoint = TvSeriesEndpoint
    let networkLoader: NetworkLoaderProtocol

    init(networkLoader: NetworkLoaderProtocol = NetworkLoaderProvider.shared.networkLoader) {
        self.networkLoader = networkLoader
    }

    func getPopularSeries() async throws -> PopularSeriesResponseModel {
        try await request(with: RequestObject(url: build(endpoint: .popularSeries)),
                responseModel: PopularSeriesResponseModel.self)
    }

    func getTopRatedSeries() async throws -> TopRatedSeriesResponseModel {
        try await request(with: RequestObject(url: build(endpoint: .topRatedSeries)),
                responseModel: TopRatedSeriesResponseModel.self)
    }

    func getSeriesGenres() async throws -> TvSeriesGenreResponseModel {
        try await request(with: RequestObject(url: build(endpoint: .seriesGenres)),
                responseModel: TvSeriesGenreResponseModel.self)
    }
}
