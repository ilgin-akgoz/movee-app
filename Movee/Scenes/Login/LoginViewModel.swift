//
//  LoginViewModel.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 20.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
}
