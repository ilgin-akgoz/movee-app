//
//  TopRatedSeriesResponseModel.swift
//  Movee
//
//  Created by Hakan Tekir on 1.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct TopRatedSeriesResponseModel: Decodable {
    let series: [TvSeriesResponseModel]

    enum CodingKeys: String, CodingKey {
        case series = "results"
    }
}
