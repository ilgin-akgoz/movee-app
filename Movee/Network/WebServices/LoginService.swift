//
//  LoginService.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 24.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

protocol LoginServiceProtocol {
    func getAuthenticationToken() async throws -> AuthenticationTokenResponseModel
    func loginWithToken(requestModel: LoginRequestModel) async throws -> LoginWithTokenResponseModel
}

final class LoginService: LoginServiceProtocol, BaseServiceProtocol {
    typealias Endpoint = LoginEndpoints
    let networkLoader: NetworkLoaderProtocol
    init(networkLoader: NetworkLoaderProtocol = NetworkLoaderProvider.shared.networkLoader) {
        self.networkLoader = networkLoader
    }
    func getAuthenticationToken() async throws -> AuthenticationTokenResponseModel {
        try await request(with: RequestObject(url: build(endpoint: .authenticationToken)),
                                            responseModel: AuthenticationTokenResponseModel.self)
    }
    func loginWithToken(requestModel: LoginRequestModel) async throws -> LoginWithTokenResponseModel {
        return try await request(
            with: RequestObject(
                url: build(endpoint: .loginWithToken),
                method: .post,
                data: requestModel,
                headers: ["Content-Type": "application/json"]
            ),
            responseModel: LoginWithTokenResponseModel.self)
    }
}
