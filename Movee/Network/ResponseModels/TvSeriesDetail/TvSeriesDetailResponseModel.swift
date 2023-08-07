//
//  TvSeriesDetailResponseModel.swift
//  Movee
//
//  Created by Hakan Tekir on 4.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct TvSeriesDetailResponseModel: Decodable {
    let id: Int
    let title: String
    let voteAverage: Double
    let firstAirDate: Date?
    let lastAirDate: Date?
    let genres: [MovieGenreItemResponseModel]
    let runtime: [Int]?
    let overview: String
    let posterPath: String?
    let numberOfSeasons: Int?
    let numberOfEpisodes: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case title = "name"
        case voteAverage = "vote_average"
        case firstAirDate = "first_air_date"
        case lastAirDate = "last_air_date"
        case genres
        case runtime = "episode_run_time"
        case overview
        case posterPath = "poster_path"
        case numberOfSeasons = "number_of_seasons"
        case numberOfEpisodes = "number_of_episodes"
    }

    var posterURL: URL {
        URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
    }

    var ratingText: String {
        String(format: "%.1f", voteAverage)
    }

    var yearRangeText: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return String(format: "%@ (%@ - %@)",
               "series.detail.series".localized,
               dateFormatter.string(from: firstAirDate ?? .now),
               dateFormatter.string(from: lastAirDate ?? .now))
    }

    var durationText: String {
        String(format: "%d %@", runtime?.first ?? 0, "movie.detail.duration".localized)
    }

    var genresText: String {
        let firstThreeGenres = genres.prefix(3).map { $0 }
        return firstThreeGenres.map { $0.name }.joined(separator: ", ")
    }

    var seasonsText: String {
        String(format: "%d %@", numberOfSeasons ?? 0, "series.detail.seasons".localized)
    }

    var episodesText: String {
         String(format: "%d %@", numberOfEpisodes ?? 0, "series.detail.episodes".localized)
    }
}
