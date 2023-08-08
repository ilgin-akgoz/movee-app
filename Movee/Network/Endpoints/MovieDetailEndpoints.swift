//
//  MovieDetailEndpoints.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 27.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

enum MovieDetailEndpoints: TargetEndpointProtocol {
    case movieDetail(movieID: Int)
    case cast(movieID: Int)
    private struct Constants {
        static let movieDetail = "movie/%d"
        static let cast = "movie/%d/credits"
    }
    var path: String {
        switch self {
        case .movieDetail(let movieID):
            return BaseEndpoint.base.path + String(format: Constants.movieDetail, movieID) + BaseEndpoint.apiKey.path
        case .cast(let movieID):
            return BaseEndpoint.base.path + String(format: Constants.cast, movieID) + BaseEndpoint.apiKey.path
        }
    }
}
