//
//  CharactersView.swift
//  paths
//
//  Created by N S on 31.10.2023.
//

import SwiftUI

final class CharactersViewModel: ObservableObject {
    
}

struct CharactersView: View {
    @StateObject var viewModel: CharactersViewModel
    @EnvironmentObject var coordinator: BaseCoordinator
    
    @State private var characters: [CharacterModel] = []
    var body: some View {
        Text("Charcater for \(coordinator.episodeId) episode")
        List(characters) { character in
            HStack {
                Button(action: {
                    showLocationForCharacter(character.location.name)
                }, label: {
                    Text(character.name)
                })
                Spacer()
                AsyncImage(url: URL(string: character.image)) { charImage in
                    if let image = charImage.image {
                    
                        image.resizable()
                            .frame(width: 50, height: 50)
                    } else {
                        Image(systemName: "person")
                    }
                }
            }
        }
        .onAppear() {
            loadCharacters(episodeId: coordinator.episodeId)
        }
    }
    
    private func showLocationForCharacter(_ location: String) {
        coordinator.goToLocationForCharacter(location)
    }
    
    func loadCharacters(episodeId: Int) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/episode/\(episodeId)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                let decoder = JSONDecoder()
                if let response = try? decoder.decode(Episode.self, from: data) {
                    var characters: [CharacterModel] = []
                    let group = DispatchGroup()
                    for characterURLString in response.characters {
                        if let characterURL = URL(string: characterURLString) {
                            group.enter()
                            URLSession.shared.dataTask(with: characterURL) { data, _, _ in
                                if let data = data {
                                    if let character = try? decoder.decode(CharacterModel.self, from: data) {
                                        characters.append(character)
                                    }
                                }
                                group.leave()
                            }
                            .resume()
                        }
                    }
                    group.notify(queue: DispatchQueue.main) {
                        self.characters = characters
                    }
                }
            }
        }
        .resume()
    }
}
