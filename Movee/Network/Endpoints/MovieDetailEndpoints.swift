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
    private struct Constants {
        static let movieDetail = "movie/:"
    }
    var path: String {
        switch self {
        case .movieDetail(let movieID):
            return BaseEndpoint.base.path + Constants.movieDetail + "\(movieID)" + BaseEndpoint.apiKey.path
        }
    }
}
