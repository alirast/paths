//
//  EpisodesView.swift
//  paths
//
//  Created by N S on 31.10.2023.
//

import SwiftUI

struct APIResponse<T: Codable>: Codable {
    let results: T
}

class EpisodesViewModel: ObservableObject {

}

struct EpisodesView: View {
    @StateObject var viewModel: EpisodesViewModel
    @EnvironmentObject var coordinator: BaseCoordinator
    
    @State private var episodes: [Episode] = []
    
    var body: some View {
        Text("Episodes")
        List(episodes) { episode in
            Button(action: {
                showCharactersForEpisode(episodeId: episode.id)
                print(episode.id)
            }) {
                Text(episode.name)
            }
        }
        .onAppear() {
            loadEpisodes()
        }
        Button(action: {
            showCharacters()
        }, label: {
            Text("Episodes button")
        })
    }
    
    func showCharacters() {
        coordinator.goToCharacters()
    }
    
    func showCharactersForEpisode(episodeId: Int) {
        coordinator.goToCharactersInEpisode(episodeId)
    }
    
    func loadEpisodes() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/episode") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                let decoder = JSONDecoder()
                if let response = try? decoder.decode(APIResponse<[Episode]>.self, from: data) {
                    DispatchQueue.main.async {
                        self.episodes = response.results
                    }
                }
            }
        }
        .resume()
    }
}

