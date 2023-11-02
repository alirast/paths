import Foundation

struct Episode: Codable, Identifiable, Hashable {
  let id: Int
  let name: String
  let characters: [String]
}
