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
    
    @State private var characters: [CharacterModel] = []
    var body: some View {
        Text("Charcater")
        List(characters) { character in
            Button(action: {
           
            }, label: {
                Text(character.name)
            })
        }
        .onAppear() {
            loadCharacters(episodeId: coordinator.episodeId)
        }
        
        Button(action: {
            showLocation()
        }, label: {
            Text("Location")
        })
    }
    
    func showLocation() {
        coordinator.goToLocation()
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


