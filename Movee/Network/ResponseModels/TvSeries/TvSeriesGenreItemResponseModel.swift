//
//  TvSeriesGenreItemResponseModel.swift
//  Movee
//
//  Created by Tekir, Hakan on 2.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct TvSeriesGenreItemResponseModel: Decodable {
    let genreID: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case genreID = "id"
        case name
    }
}
