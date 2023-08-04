//
//  TvSeriesDetailProtocol.swift
//  Movee
//
//  Created by Hakan Tekir on 4.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

protocol TvSeriesDetailServiceProtocol {
    func getMovieDetails(for seriesID: Int) async throws -> TvSeriesDetailResponseModel
}

final class TvSeriesDetailService: TvSeriesDetailServiceProtocol, BaseServiceProtocol {
    typealias Endpoint = TvSeriesDetailEndpoint
    let networkLoader: NetworkLoaderProtocol

    init(networkLoader: NetworkLoaderProtocol = NetworkLoaderProvider.shared.networkLoader) {
        self.networkLoader = networkLoader
    }

    func getMovieDetails(for seriesID: Int) async throws -> TvSeriesDetailResponseModel {
        try await request(with: RequestObject(url: build(endpoint: .seriesDetail(seriesID: seriesID))),
                responseModel: TvSeriesDetailResponseModel.self)
    }
}
