//
//  PersonnageWorker.swift
//  VIP_Sample
//
//  Created by Thomas TEROSIET on 14/12/2024.
//

import Foundation

protocol PersonnageWorkerLogic {
    func fetchPersonnages() async -> Result<PokemonApiResult, Error>
}

struct PersonnageWorker {
}

extension PersonnageWorker: PersonnageWorkerLogic {
    
    func fetchPersonnages() async -> Result<PokemonApiResult, Error> {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=10")!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            print("data", data)
            let result = try JSONDecoder().decode(PokemonApiResult.self, from: data)
            return .success(result)
        } catch {
            return .failure(error)
        }
    }
}
