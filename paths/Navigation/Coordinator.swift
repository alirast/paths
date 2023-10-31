//
//  Coordinator.swift
//  paths
//
//  Created by N S on 31.10.2023.
//

import SwiftUI

final class BaseCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var episodeId = Int()
    @Published var location = String()
    
    func goToEpisodes() {
        path.append(DestinationFlowPage.episodes)
    }
    
    func goToRoot() {
        path.removeLast(path.count)
    }
    
    func goToCharactersInEpisode(_ episodeId: Int) {
        path.append(DestinationFlowPage.characters)
        self.episodeId = episodeId
    }
    
    func goToLocationForCharacter(_ location: String) {
        path.append(DestinationFlowPage.location)
        self.location = location
    }
}
