//
//  PersonDetailEndpoint.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 7.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

enum PersonDetailEndpoint: TargetEndpointProtocol {
    case personDetail(personID: Int)
    private struct Constants {
        static let personDetail = "person/%d"
    }
    var path: String {
        switch self {
        case .personDetail(let personID):
            return BaseEndpoint.base.path + String(format: Constants.personDetail, personID) + BaseEndpoint.apiKey.path
        }
    }
}
