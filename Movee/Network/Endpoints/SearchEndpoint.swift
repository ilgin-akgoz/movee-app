//
//  SearchEndpoint.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 9.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

enum SearchEndpoint: TargetEndpointProtocol {
    case search(query: String)
    private struct Constants {
        static let search = "search/multi%@&query=%@"
    }
    var path: String {
        switch self {
        case .search(let query):
            let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            return BaseEndpoint.base.path + String(format: Constants.search, BaseEndpoint.apiKey.path, encodedQuery)
        }
    }
}
