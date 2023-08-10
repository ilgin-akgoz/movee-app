//
//  SearchResponseModel.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 9.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct SearchResponseModel: Decodable {
    let results: [SearchResultsResponseModel]
}
