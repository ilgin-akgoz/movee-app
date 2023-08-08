//
//  MediaDataProtocol.swift
//  Movee
//
//  Created by Tekir, Hakan on 2.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

protocol MediaDataProtocol: Identifiable {
    var id: Int { get }
    var title: String { get }
    var genres: [String] { get }
    var posterPath: String? { get }
    var voteAverage: Double { get }
    var releaseDate: Date? { get }
}

extension MediaDataProtocol {
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
