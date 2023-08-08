//
//  TvSeriesEndpoint.swift
//  Movee
//
//  Created by Hakan Tekir on 1.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

enum TvSeriesEndpoint: TargetEndpointProtocol {
    case popularSeries
    case topRatedSeries
    case seriesGenres

    private struct Constants {
        static let popularSeries = "/tv/popular"
        static let topRatedSeries = "/tv/top_rated"
        static let seriesGenres = "/genre/tv/list"
    }

    var path: String {
        switch self {
        case .popularSeries:
            return BaseEndpoint.base.path + Constants.popularSeries + BaseEndpoint.apiKey.path
        case .topRatedSeries:
            return BaseEndpoint.base.path + Constants.topRatedSeries + BaseEndpoint.apiKey.path
        case .seriesGenres:
            return BaseEndpoint.base.path + Constants.seriesGenres + BaseEndpoint.apiKey.path
        }
    }
}
