//
//  TvSeriesDataModel.swift
//  Movee
//
//  Created by Tekir, Hakan on 2.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct TvSeriesDataModel: MediaDataProtocol, Identifiable, Hashable {
    let id: Int
    let title: String
    let genres: [String]
    let posterPath: String?
    let voteAverage: Double
    let releaseDate: Date?
}
