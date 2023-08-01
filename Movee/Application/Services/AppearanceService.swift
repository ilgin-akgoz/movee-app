//
//  AppearanceService.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 31.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation
import UIKit

class AppearanceService {
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = UIColor(named: "vibrantBlue")
        UINavigationBar.appearance().standardAppearance = navBarAppearance
    }
}
