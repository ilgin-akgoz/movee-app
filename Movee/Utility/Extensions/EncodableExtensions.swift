//
//  EncodableExtensions.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 25.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

extension Encodable {
    func encode() -> Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(self)
    }
}
