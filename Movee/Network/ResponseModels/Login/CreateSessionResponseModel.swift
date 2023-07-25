//
//  CreateSessionResponseModel.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 24.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct CreateSessionResponseModel: Decodable {
    let success: Bool
    let sessionId: String
    enum CodingKeys: String, CodingKey {
        case success
        case sessionId = "session_id"
    }
}
