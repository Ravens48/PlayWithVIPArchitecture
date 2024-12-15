//
//  PersonnageDataStore.swift
//  VIP_Sample
//
//  Created by Thomas TEROSIET on 14/12/2024.
//

import Foundation

class PersonnageDataStore: ObservableObject {
    @Published var personnages: [Personnage] = []
}
