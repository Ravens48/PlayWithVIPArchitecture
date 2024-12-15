//
//  PersonnagePresenter.swift
//  VIP_Sample
//
//  Created by Thomas TEROSIET on 14/12/2024.
//

protocol PersonnagePresenterLogic {
    func presentPersonnage(result: RickAndMortyResult)
}

class PersonnagePresenter {
    var view: PersonnageDisplayLogic?
}

extension PersonnagePresenter: PersonnagePresenterLogic {
    func presentPersonnage(result: RickAndMortyResult) {
        self.view?.displayPersonnage(personnages: result.results)
    }
}
