//
//  PersonnageWorker.swift
//  VIP_Sample
//
//  Created by Thomas TEROSIET on 14/12/2024.
//

import Foundation

protocol PersonnageWorkerLogic {
    func fetchPersonnages() async -> Result<RickAndMortyResult, Error>
}

struct PersonnageWorker {
}

extension PersonnageWorker: PersonnageWorkerLogic {
    
    func fetchPersonnages() async -> Result<RickAndMortyResult, Error> {
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            print("data", data)
            let result = try JSONDecoder().decode(RickAndMortyResult.self, from: data)
            return .success(result)
        } catch {
            return .failure(error)
        }
    }
}
