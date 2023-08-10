//
//  SearchResultsResponseModel.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 9.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct SearchResultsResponseModel: Decodable {
    let id: Int?
    let title: String?
    let overview: String?
    let posterPath: String?
    let mediaType: String?
    let profilePath: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case profilePath = "profile_path"
        case name
    }
}
