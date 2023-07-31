//
//  MovieEndpoints.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 26.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

enum MovieEndpoints: TargetEndpointProtocol {
    case nowPlayingMovies
    case popularMovies
    case movieGenre
    private struct Constants {
        static let nowPlayingMovies = "movie/now_playing"
        static let popularMovies = "movie/popular"
        static let movieGenre = "genre/movie/list"
    }
    var path: String {
        switch self {
        case .nowPlayingMovies:
            return BaseEndpoint.base.path +
            Constants.nowPlayingMovies +
            BaseEndpoint.apiKey.path +
            LocaleEndpoint.deviceLanguage.path
        case .popularMovies:
            return BaseEndpoint.base.path +
            Constants.popularMovies +
            BaseEndpoint.apiKey.path +
            LocaleEndpoint.deviceLanguage.path
        case .movieGenre:
            return BaseEndpoint.base.path +
            Constants.movieGenre +
            BaseEndpoint.apiKey.path +
            LocaleEndpoint.deviceLanguage.path
        }
    }
}
