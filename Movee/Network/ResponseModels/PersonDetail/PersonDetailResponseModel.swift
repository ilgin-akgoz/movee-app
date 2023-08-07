//
//  PersonDetailResponseModel.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 7.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct PersonDetailResponseModel: Decodable {
    let id: Int?
    let name: String?
    let birthday: Date?
    let biography: String?
    let placeOfBirth: String?
    let profilePath: String?
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case birthday
        case biography
        case placeOfBirth = "place_of_birth"
        case profilePath = "profile_path"
    }
    var profileURL: URL {
        URL(string: "https://image.tmdb.org/t/p/w500\(profilePath ?? "")")!
    }
    var bornText: String {
        let birthday = DateFormatter.localizedFormatter.string(from: birthday ?? Date())
        return String(format: "%@ %@ %@", birthday, "person.detail.in".localized, placeOfBirth ?? "N/A")
    }
}
