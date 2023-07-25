//
//  BaseServiceProtocol.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 24.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

protocol BaseServiceProtocol {
    associatedtype Endpoint: TargetEndpointProtocol
    var networkLoader: NetworkLoaderProtocol { get }
    func request<T: Decodable>(with requestObject: RequestObject, responseModel: T.Type) async throws -> T
}

extension BaseServiceProtocol {
    func request<T: Decodable>(with requestObject: RequestObject, responseModel: T.Type) async throws -> T {
        try await networkLoader.request(with: requestObject, responseModel: responseModel)
    }
    func build(endpoint: Endpoint) -> String {
        endpoint.path
    }
}
