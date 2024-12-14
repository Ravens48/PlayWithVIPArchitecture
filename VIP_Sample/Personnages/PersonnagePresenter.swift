//
//  PersonnagePresenter.swift
//  VIP_Sample
//
//  Created by Thomas TEROSIET on 14/12/2024.
//

protocol PersonnagePresenterLogic {
    func presentPersonnage(pokemonsResult: PokemonApiResult)
    func presentFailedFetchData()
}

class PersonnagePresenter {
    var view: PersonnageDisplayLogic?
}

extension PersonnagePresenter: PersonnagePresenterLogic {
    func presentPersonnage(pokemonsResult: PokemonApiResult) {
        self.view?.displayPersonnage(pokemons: pokemonsResult.results)
    }
    
    func presentFailedFetchData() {
        self.view?.displayPlaceHolderNoData()
    }
    
}
