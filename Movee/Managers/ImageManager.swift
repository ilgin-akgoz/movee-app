//
//  ImageManager.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 8.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

class ImageManager {
    static let instance = ImageManager()
    private init() {}
    func buildURL(_ posterPath: String) -> URL {
        let pathString = "https://image.tmdb.org/t/p/w500\(posterPath)"
        return URL(string: pathString)!
    }
}
