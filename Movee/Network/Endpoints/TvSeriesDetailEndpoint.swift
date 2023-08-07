//
//  TvSeriesDetailEndpoint.swift
//  Movee
//
//  Created by Hakan Tekir on 4.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

enum TvSeriesDetailEndpoint: TargetEndpointProtocol {
    case seriesDetail(seriesID: Int)
    case cast(seriesID: Int)
    private struct Constants {
        static let seriesDetail = "tv/%d"
        static let cast = "tv/%d/credits"
    }
    var path: String {
        switch self {
        case .seriesDetail(let seriesID):
            return BaseEndpoint.base.path + String(format: Constants.seriesDetail, seriesID) + BaseEndpoint.apiKey.path
        case .cast(let seriesID):
            return BaseEndpoint.base.path + String(format: Constants.cast, seriesID) + BaseEndpoint.apiKey.path
        }
    }
}
