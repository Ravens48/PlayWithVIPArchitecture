//
//  ContentView.swift
//  VIP_Sample
//
//  Created by Thomas TEROSIET on 14/12/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            PersonnageViewController().configureView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
