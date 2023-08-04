//
//  TvSeriesViewModel.swift
//  Movee
//
//  Created by Hakan Tekir on 1.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

@MainActor
class TvSeriesViewModel: ObservableObject {
    @Published var nowPlayingSeries: [TvSeriesDataModel] = []
    @Published var popularSeries: [TvSeriesDataModel] = []
    @Published var isLoading: Bool = true
    private let tvSeriesService: TvSeriesServiceProtocol

    init(tvSeriesService: TvSeriesServiceProtocol = TvSeriesService()) {
        self.tvSeriesService = tvSeriesService
    }

    private func matchGenresForSeries(
        series: [TvSeriesResponseModel],
        genres: [TvSeriesGenreItemResponseModel]
    ) -> [TvSeriesDataModel] {
        return series.map { series in
            let genreNames = getGenreNames(series: series, genres: genres)
            return TvSeriesDataModel(
                id: series.seriesID,
                title: series.title,
                genres: genreNames,
                posterPath: series.posterPath,
                voteAverage: series.voteAverage,
                releaseDate: series.releaseDate)
        }
    }

    private func fetchPopularSereis() async throws -> [TvSeriesResponseModel] {
        let response = try await tvSeriesService.getPopularSeries()
        return response.series
    }

    private func fetchTopRatedSeries() async throws -> [TvSeriesResponseModel] {
        let response = try await tvSeriesService.getTopRatedSeries()
        return response.series
    }

    private func fetchSeriesGenres() async throws -> [TvSeriesGenreItemResponseModel] {
        let response = try await tvSeriesService.getSeriesGenres()
        return response.genres
    }

    func fetchSeries() async {
        do {
            let nowPlayingSeries = try await fetchPopularSereis()
            let popularSeries = try await fetchTopRatedSeries()
            let seriesGenres = try await fetchSeriesGenres()

            self.nowPlayingSeries = self.matchGenresForSeries(series: nowPlayingSeries, genres: seriesGenres)
            self.popularSeries = self.matchGenresForSeries(series: popularSeries, genres: seriesGenres)
            self.isLoading = false
        } catch {
            print("\(error)")
        }
    }

    private func getGenreNames(series: TvSeriesResponseModel, genres: [TvSeriesGenreItemResponseModel]) -> [String] {
        let genreNames = genres.filter { series.genreIDs.contains($0.genreID) }.map { $0.name }
        return genreNames
    }
}
