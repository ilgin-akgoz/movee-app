//
//  LoginEndpoints.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 24.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

enum LoginEndpoints: TargetEndpointProtocol {
    case authenticationToken
    case loginWithToken
    private struct Constants {
        static let authenticationToken = "authentication/token/new"
        static let loginWithToken = "authentication/token/validate_with_login"
    }
    var path: String {
        switch self {
        case .authenticationToken:
            return BaseEndpoint.base.path + Constants.authenticationToken + BaseEndpoint.apiKey.path
        case .loginWithToken:
            return BaseEndpoint.base.path + Constants.loginWithToken + BaseEndpoint.apiKey.path
        }
    }
}
