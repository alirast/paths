import SwiftUI

final class BaseCoordinator: ObservableObject {
  
  //if something changes - as dynamic property - where we are subscribed for somethng - changes happen
  //@Published var path             = NavigationPath() //navigation path is structure
  @Published var path: [Route]    = []
  @Published var episodeId: Int   = 0
  @Published var location: String = ""
  
  func goToEpisodes() {
    path.append(Route.episodes)
  }
  
  func goToRoot() {
    path.removeAll() //it will work because navigation path has exact type of object - objects that conform hashable protocol
    //path.removeLast(path.count) - we delete everything from the navigation
  }
  
  func goToCharactersInEpisode(_ episodeId: Int) {
    path.append(Route.characters)
    self.episodeId = episodeId
  }
  
  func goToLocationForCharacter(_ location: String) {
    path.append(Route.location)
    self.location = location
  }
}
