//
//  HomeView.swift
//  paths
//
//  Created by N S on 31.10.2023.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
}

struct HomeView: View {
    @EnvironmentObject var coordinator: BaseCoordinator
    @StateObject var viewModel: HomeViewModel
    var body: some View {
        Button(action: {
            showEpisodes()
        }, label: {
            Text("Show episodes")
        })
    }
    
    func showEpisodes() {
        coordinator.goToEpisodes()
    }
}


