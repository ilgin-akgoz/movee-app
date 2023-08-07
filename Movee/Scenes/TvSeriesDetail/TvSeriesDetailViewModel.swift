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
    private let seriesID: Int
    private let seriesDetailService: TvSeriesDetailServiceProtocol
    init(seriesDetailService: TvSeriesDetailServiceProtocol = TvSeriesDetailService(),
         seriesID: Int
         ) {
        self.seriesDetailService = seriesDetailService
        self.seriesID = seriesID
    }

    func fetchMovie() async {
        do {
            let seriesDetails = try await fetchMovieDetails()
            self.seriesDetails = seriesDetails
        } catch {
            print("\(error)")
        }
    }

    private func fetchMovieDetails() async throws -> TvSeriesDetailResponseModel {
        try await seriesDetailService.getMovieDetails(for: seriesID)
    }
}
