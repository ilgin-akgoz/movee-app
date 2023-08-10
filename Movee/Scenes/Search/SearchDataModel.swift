//
//  SearchDataModel.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 9.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct SearchDataModel {
    var id: Int
    var title: String
    var overview: String
    var imagePath: String
    var mediaType: MediaType
    var mediaTypeIcon: String
    var mediaTypeText: String
}

enum MediaType: String {
    case movie = "movie"
    case tvSeries = "tv"
    case person = "person"
}
