//
//  SessionRequestModel.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 24.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct SessionRequestModel: Encodable {
    let requestToken: String
    enum CodingKeys: String, CodingKey {
        case requestToken = "request_token"
    }
}
