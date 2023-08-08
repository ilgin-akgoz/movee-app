//
//  PersonDetailViewModel.swift
//  Movee
//
//  Created by Akgoz, Ilgin on 7.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

@MainActor
class PersonDetailViewModel: ObservableObject {
    @Published var personDetails: PersonDetailResponseModel?
    private let personID: Int
    private let personDetailService: PersonDetailServiceProtocol
    init(personDetailService: PersonDetailServiceProtocol = PersonDetailService(),
         personID: Int) {
        self.personDetailService = personDetailService
        self.personID = personID
    }
    func fetchDetails() async {
        do {
            let personDetails = try await fetchPersonDetails()
            self.personDetails = personDetails
        } catch {
            print("\(error)")
        }
    }
    private func fetchPersonDetails() async throws -> PersonDetailResponseModel {
        try await personDetailService.getPersonDetails(for: personID)
    }
}
