//
//  TvSeriesResponseModel.swift
//  Movee
//
//  Created by Tekir, Hakan on 2.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct TvSeriesResponseModel: Decodable {
    let seriesID: Int
    let title: String
    let overview: String
    let genreIDs: [Int]
    let backdropPath: String?
    let posterPath: String?
    let popularity: Double
    let voteAverage: Double
    let releaseDate: Date?

    enum CodingKeys: String, CodingKey {
        case seriesID = "id"
        case title = "name"
        case overview
        case genreIDs = "genre_ids"
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case popularity
        case voteAverage = "vote_average"
        case releaseDate = "first_air_date"
    }
}
