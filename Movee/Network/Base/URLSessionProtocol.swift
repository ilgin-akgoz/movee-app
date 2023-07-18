//
//  URLSessionProtocol.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 18.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

protocol URLSessionProtocol {
    func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol { }
