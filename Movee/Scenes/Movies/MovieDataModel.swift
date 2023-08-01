//
//  MovieDataModel.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 29.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct MovieDataModel {
    let movieID: Int
    let title: String
    let genres: [String]
    let posterPath: String?
    let voteAverage: Double
    let releaseDate: Date?
    var posterURL: URL {
        URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
    }
    var ratingText: String {
        String(format: "%.1f", voteAverage)
    }
    var formattedReleaseDate: String {
        DateFormatter.dayFirstFormatter.string(from: releaseDate ?? Date())
    }
    var genresText: String {
        let firstThreeGenres = genres.prefix(3).map { $0 }
        return firstThreeGenres.joined(separator: ", ")
    }
}
