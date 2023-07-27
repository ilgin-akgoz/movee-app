//
//  MovieGenreResponseModel.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 26.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct MovieGenreResponseModel: Decodable {
    let genres: [MovieGenreItemResponseModel]
}
