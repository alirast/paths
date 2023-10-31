//
//  CharactersView.swift
//  paths
//
//  Created by N S on 31.10.2023.
//

import SwiftUI

class CharactersViewModel: ObservableObject {
    
}

struct CharactersView: View {
    @StateObject var viewModel: CharactersViewModel
    @EnvironmentObject var coordinator: BaseCoordinator
    var body: some View {
        Text("Charcater")
        Button(action: {
            showLocation()
        }, label: {
            Text("Location")
        })
    }
    
    func showLocation() {
        coordinator.goToLocation()
    }
}


