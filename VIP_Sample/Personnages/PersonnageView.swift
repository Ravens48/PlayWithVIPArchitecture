//
//  PersonnageView.swift
//  VIP_Sample
//
//  Created by Thomas TEROSIET on 14/12/2024.
//

import SwiftUI

protocol PersonnageDisplayLogic {
    func displayPersonnage(pokemons:[Pokemon])
    func displayPlaceHolderNoData()
}

struct PersonnageViewController: View {
    @ObservedObject var personnageDataStore = PersonnageDataStore()
    var interactor: PersonnageInteractorLogic?
    
    var body: some View {
        VStack {
            ForEach(personnageDataStore.pokemons, id: \.self.name) { pokemon in
                VStack {
                    Text(pokemon.name)
                }
                .frame(maxWidth: .infinity)
                .padding(20)
                .border(.black)
                .onTapGesture {
                    print(pokemon.name)
                }
            }
        }
        .task {
            interactor?.fetchPersonnage()
        }
    }
}

extension PersonnageViewController: PersonnageDisplayLogic {
    func displayPersonnage(pokemons: [Pokemon]) {
        DispatchQueue.main.async {
            personnageDataStore.pokemons = pokemons
            
        }
    }
    
    func displayPlaceHolderNoData() {
        //
    }
    
    
}

extension PersonnageViewController {
    func configureView() -> some View {
        var view = self
        let interactor = PersonnageInteractor()
        let presenter = PersonnagePresenter()
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        return view
    }
}
