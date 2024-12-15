//
//  PersonnageInteractor.swift
//  VIP_Sample
//
//  Created by Thomas TEROSIET on 14/12/2024.
//
import Foundation

protocol PersonnageInteractorLogic {
    func fetchPersonnage()
}

class PersonnageInteractor {
    var presenter: PersonnagePresenterLogic?
    let worker = PersonnageWorker()
}

extension PersonnageInteractor: PersonnageInteractorLogic {
    func fetchPersonnage() {
        Task {
            let response = await worker.fetchPersonnages()
            switch response {
            case .success(let result):
                presenter?.presentPersonnage(result: result)
            case .failure(let failure):
                print("failure, \(failure)")
            }
        }
    }
}
