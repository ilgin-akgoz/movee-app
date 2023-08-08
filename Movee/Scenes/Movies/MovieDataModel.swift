//
//  MovieDataModel.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 29.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct MovieDataModel: MediaDataProtocol {
    let id: Int
    let title: String
    let genres: [String]
    let posterPath: String?
    let voteAverage: Double
    let releaseDate: Date?
    var ratingText: String {
        String(format: "%.1f", voteAverage)
    }
    var formattedReleaseDate: String {
        DateFormatter.localizedFormatter.string(from: releaseDate ?? Date())
    }
    var genresText: String {
        let firstThreeGenres = genres.prefix(3).map { $0 }
        return firstThreeGenres.joined(separator: ", ")
    }
}
