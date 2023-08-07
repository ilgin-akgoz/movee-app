//
//  TvSeriesDetailProtocol.swift
//  Movee
//
//  Created by Hakan Tekir on 4.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

protocol TvSeriesDetailServiceProtocol {
    func getTvSeriesDetails(for seriesID: Int) async throws -> TvSeriesDetailResponseModel
    func getCast(of seriesID: Int) async throws -> CastResponseModel
}

final class TvSeriesDetailService: TvSeriesDetailServiceProtocol, BaseServiceProtocol {
    typealias Endpoint = TvSeriesDetailEndpoint
    let networkLoader: NetworkLoaderProtocol

    init(networkLoader: NetworkLoaderProtocol = NetworkLoaderProvider.shared.networkLoader) {
        self.networkLoader = networkLoader
    }

    func getTvSeriesDetails(for seriesID: Int) async throws -> TvSeriesDetailResponseModel {
        try await request(with: RequestObject(url: build(endpoint: .seriesDetail(seriesID: seriesID))),
                responseModel: TvSeriesDetailResponseModel.self)
    }
    func getCast(of seriesID: Int) async throws -> CastResponseModel {
        try await request(with: RequestObject(url: build(endpoint: .cast(seriesID: seriesID))),
                          responseModel: CastResponseModel.self)
    }
}
