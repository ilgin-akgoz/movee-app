//
//  MovieGenreItemResponseModel.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 26.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct MovieGenreItemResponseModel: Decodable {
    let genreID: Int
    let name: String
    enum CodingKeys: String, CodingKey {
        case genreID = "id"
        case name
    }
}
