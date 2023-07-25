//
//  BaseEndpoint.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 24.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

enum BaseEndpoint: TargetEndpointProtocol {
    case base
    case apiKey
    var path: String {
        switch self {
        case .base:
            return Configuration.baseURL
        case .apiKey:
            return Configuration.apiKey
        }
    }
}
