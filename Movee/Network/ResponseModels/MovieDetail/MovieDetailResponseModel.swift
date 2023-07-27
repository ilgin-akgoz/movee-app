//
//  MovieDetailResponseModel.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 27.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct MovieDetailResponseModel: Decodable {
    let id: Int
    let title: String
    let voteAverage: Double
    let releaseDate: String?
    let genres: [MovieGenreItemResponseModel]?
    let runtime: Int
    let overview: String
    let posterPath: String?
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
        case genres
        case runtime
        case overview
        case posterPath = "poster_path"
    }
    var posterURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
    }
    var ratingText: String {
        return String(format: "%.1f", voteAverage)
    }
    var formattedReleaseDate: String {
        if let dateStr = releaseDate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"

            if let date = dateFormatter.date(from: dateStr) {
                dateFormatter.dateFormat = "dd.MM.yyyy"
                return dateFormatter.string(from: date)
            }
        }
        return "dd.mm.yyyy"
    }
}
