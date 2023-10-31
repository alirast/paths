//
//  EpisodesView.swift
//  paths
//
//  Created by N S on 31.10.2023.
//

import SwiftUI

class EpisodesViewModel: ObservableObject {
    
}

struct EpisodesView: View {
    @StateObject var viewModel: EpisodesViewModel
    @EnvironmentObject var coordinator: BaseCoordinator
    var body: some View {
        Text("Episodes")
        Button(action: {
            showCharacters()
        }, label: {
            Text("Episodes button")
        })
    }
    
    func showCharacters() {
        coordinator.goToCharacters()
    }
}

