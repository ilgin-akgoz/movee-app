//
//  Configuration.swift
//  boilerplate-ios-swiftui
//
//  Created by Baha Ulug on 1.12.2020.
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import Foundation

final class Configuration: ConfigurationProtocol {

    static var isProduction: Bool {
        #if Production
            return true
        #else
            return false
        #endif
    }

    static var isAppStore: Bool {
        #if AppStore
            return true
        #else
            return false
        #endif
    }

    static var isDevelopment: Bool {
        #if Development
            return true
        #else
            return false
        #endif
    }
    static var baseURL: String {
        let url: String? = try? self.value(for: "BASE_URL")
        return url ?? ""
    }
    static var apiKey: String {
        let key: String? = try? self.value(for: "API_KEY")
        guard let key, !key.isEmpty else {
            return ""
        }
        return key
    }
}
