//
//  TvSeriesDetailViewModel.swift
//  Movee
//
//  Created by Hakan Tekir on 4.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

@MainActor
class TvSeriesDetailViewModel: ObservableObject {
    @Published var seriesDetails: TvSeriesDetailResponseModel?
    @Published var cast: [ActorResponseModel] = []
    private let seriesID: Int
    private let seriesDetailService: TvSeriesDetailServiceProtocol
    init(seriesDetailService: TvSeriesDetailServiceProtocol = TvSeriesDetailService(),
         seriesID: Int
         ) {
        self.seriesDetailService = seriesDetailService
        self.seriesID = seriesID
    }
    func fetchDetails() async {
        do {
            let seriesDetails = try await fetchTvSeriesDetails()
            let cast = try await fetchCast()
            self.seriesDetails = seriesDetails
            self.cast = cast
        } catch {
            print("\(error)")
        }
    }
    private func fetchTvSeriesDetails() async throws -> TvSeriesDetailResponseModel {
        try await seriesDetailService.getTvSeriesDetails(for: seriesID)
    }
    private func fetchCast() async throws -> [ActorResponseModel] {
        let response = try await seriesDetailService.getCast(of: seriesID)
        return response.cast
    }
}
