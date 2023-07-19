//
//  ErrorResponse.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 18.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

class ErrorResponse: Decodable {
    var code: Int?
    var message: String?
    var messages: [String: String]?
}
