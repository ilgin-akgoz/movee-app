//
//  LoginViewModel.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 20.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var showLoginFailedView = false
    private let loginService: LoginServiceProtocol
    init(loginService: LoginServiceProtocol = LoginService()) {
        self.loginService = loginService
    }
    func login() async {
        do {
            let requestToken = try await fetchRequestToken()
            let validatedToken = try await fetchValidatedToken(with: requestToken)
            saveToken(validatedToken)
        } catch {
            DispatchQueue.main.async {
                self.showLoginFailedView = true
            }
        }
    }
    func fetchRequestToken() async throws -> String {
        let authResponse = try await loginService.getAuthenticationToken()
        return authResponse.requestToken
    }
    func fetchValidatedToken(with token: String) async throws -> String {
        let loginRequestModel = LoginRequestModel(username: email,
                                                 password: password,
                                                 requestToken: token)
        let loginResponse = try await loginService.loginWithToken(requestModel: loginRequestModel)
        return loginResponse.requestToken
    }
    func saveToken(_ validatedToken: String) {
        do {
            try KeychainManager.saveToken(validatedToken, forKey: "\(email)")
        } catch {
            print(error)
        }
    }
}
