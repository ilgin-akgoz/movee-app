//
//  SearchEndpoint.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 9.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

enum SearchEndpoint: TargetEndpointProtocol {
    case search
    private struct Constants {
        static let search = "search/multi"
    }
    var path: String {
        switch self {
        case .search:
            return BaseEndpoint.base.path + Constants.search + BaseEndpoint.apiKey.path
        }
    }
}
