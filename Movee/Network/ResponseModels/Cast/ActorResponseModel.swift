//
//  ActorResponseModel.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 7.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct ActorResponseModel: Decodable, Hashable {
    let id: Int?
    let name: String?
    let profilePath: String?
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case profilePath = "profile_path"
    }
    var profileURL: URL {
        URL(string: "https://image.tmdb.org/t/p/w500\(profilePath ?? "")")!
    }
}
