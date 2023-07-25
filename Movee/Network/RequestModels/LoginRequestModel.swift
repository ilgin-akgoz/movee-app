//
//  LoginRequestModel.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 24.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct LoginRequestModel: Encodable {
    let username: String
    let password: String
    let requestToken: String
    enum CodingKeys: String, CodingKey {
        case username
        case password
        case requestToken = "request_token"
    }
}
