import Foundation


struct CharacterModel: Codable, Identifiable, Hashable {
  let id: Int
  let name: String
  let image: String
  let origin, location: Location
}

struct Location: Codable, Hashable {
  let name: String
  let url: String
  //let residents: [String]
}
