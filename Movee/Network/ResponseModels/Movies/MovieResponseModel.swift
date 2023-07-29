//
//  MovieResponseModel.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 26.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct MovieResponseModel: Decodable {
    let movieID: Int
    let title: String
    let overview: String
    let genreIDs: [Int]
    let posterPath: String?
    let backdropPath: String?
    let popularity: Double
    let voteAverage: Double
    let isAdult: Bool
    let releaseDate: Date?
    enum CodingKeys: String, CodingKey {
        case movieID = "id"
        case title
        case overview
        case genreIDs = "genre_ids"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case popularity
        case voteAverage = "vote_average"
        case isAdult = "adult"
        case releaseDate = "release_date"
    }
    var posterURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
    }
    var ratingText: String {
        return String(format: "%.1f", voteAverage)
    }
    var formattedReleaseDate: String {
        return DateFormatter.dayFirstFormatter.string(from: releaseDate ?? Date())
    }
}
