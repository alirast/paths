//
//  pathsApp.swift
//  paths
//
//  Created by N S on 31.10.2023.
//

import SwiftUI

class BaseCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var episodeId = Int()
    func goToEpisodes() {
        path.append(DestinationFlowPage.episodes)
    }
    
    func goToRoot() {
        path.removeLast(path.count)
    }
    
    func goToCharacters() {
        path.append(DestinationFlowPage.characters)
    }
    
    func goToCharactersInEpisode(_ episodeId: Int) {
        path.append(DestinationFlowPage.characters)
        self.episodeId = episodeId
    }
    
    func goToLocation() {
        path.append(DestinationFlowPage.location)
    }
    
}

@main
struct pathsApp: App {
    @ObservedObject var coordinator = BaseCoordinator()
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.path) {
                ZStack {
                    appContent()
                }
                .navigationDestination(for: DestinationFlowPage.self) { destination in
                    ViewFactory.viewForDestination(destination)
                }
            }
            .environmentObject(coordinator)
        }
        
    }
    
    @ViewBuilder func appContent() -> some View {
        ViewFactory.getHomeView()
    }
}
