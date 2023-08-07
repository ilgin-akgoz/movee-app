//
//  PersonDetailService.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 7.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

protocol PersonDetailServiceProtocol {
    func getPersonDetails(for personID: Int) async throws -> PersonDetailResponseModel
}

final class PersonDetailService: PersonDetailServiceProtocol, BaseServiceProtocol {
    typealias Endpoint = PersonDetailEndpoint
    let networkLoader: NetworkLoaderProtocol
    init(networkLoader: NetworkLoaderProtocol = NetworkLoaderProvider.shared.networkLoader) {
        self.networkLoader = networkLoader
    }
    func getPersonDetails(for personID: Int) async throws -> PersonDetailResponseModel {
        try await request(with: RequestObject(url: build(endpoint: .personDetail(personID: personID))),
                responseModel: PersonDetailResponseModel.self)
    }
}
