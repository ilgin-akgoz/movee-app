//
//  NetworkLoaderProvider.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 24.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

class NetworkLoaderProvider {
    static let shared: NetworkLoaderProvider = NetworkLoaderProvider()
    let networkLoader: NetworkLoaderProtocol
    private init() {
        networkLoader = NetworkLoader()
    }
}
