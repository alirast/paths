import Foundation

struct APIResponse<T: Codable>: Codable {
  let results: T
}
