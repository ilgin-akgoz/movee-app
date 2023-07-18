//
//  NetworkLoader.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 18.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

class NetworkLoader: NetworkLoaderProtocol {
    var session: URLSessionProtocol = URLSession.shared
    var decoder: JSONDecoder = JSONDecoder()
}
