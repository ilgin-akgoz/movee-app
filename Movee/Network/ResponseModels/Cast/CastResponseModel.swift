//
//  CastResponseModel.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 7.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct CastResponseModel: Decodable {
    let cast: [ActorResponseModel]
}
