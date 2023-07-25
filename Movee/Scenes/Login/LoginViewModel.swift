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
            let authResponse = try await loginService.getAuthenticationToken()
            let requestToken = authResponse.requestToken
            let loginRequestModel = LoginRequestModel(username: email,
                                                    password: password,
                                                    requestToken: requestToken)
            let loginResponse = try await loginService.loginWithToken(requestModel: loginRequestModel)
            let validatedToken = loginResponse.requestToken
            let sessionRequestModel = SessionRequestModel(requestToken: validatedToken)
            let sessionResponse = try await loginService.createSession(requestModel: sessionRequestModel)
            let sessionId = sessionResponse.sessionId
        } catch {
            DispatchQueue.main.async {
                self.showLoginFailedView = true
            }
        }
    }
}
