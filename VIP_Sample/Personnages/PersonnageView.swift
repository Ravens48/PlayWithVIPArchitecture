//
//  PersonnageView.swift
//  VIP_Sample
//
//  Created by Thomas TEROSIET on 14/12/2024.
//

import SwiftUI

protocol PersonnageDisplayLogic {
    func displayPersonnage(personnages:[Personnage])
}

struct PersonnageViewController: View {
    @ObservedObject var personnageDataStore = PersonnageDataStore()
    var interactor: PersonnageInteractorLogic?
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(personnageDataStore.personnages, id: \.self.id) { personnage in
                    HStack {
                        AsyncImage(url: URL(string: personnage.image)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                        Spacer()
                        Text(personnage.name)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(20)
                    .border(.black)
                    .onTapGesture {
                        print(personnage.name)
                    }
                }
            }
        }
        .task {
            interactor?.fetchPersonnage()
        }
    }
}

extension PersonnageViewController: PersonnageDisplayLogic {
    func displayPersonnage(personnages: [Personnage]) {
        DispatchQueue.main.async {
            personnageDataStore.personnages = personnages
            
        }
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
