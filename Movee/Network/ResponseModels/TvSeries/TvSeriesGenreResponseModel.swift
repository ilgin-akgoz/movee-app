//
//  TvSeriesGenreResponseModel.swift
//  Movee
//
//  Created by Tekir, Hakan on 2.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct TvSeriesGenreResponseModel: Decodable {
    let genres: [TvSeriesGenreItemResponseModel]
}
