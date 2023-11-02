import SwiftUI

enum Route: Hashable, Identifiable {
  var id: String {
    String(describing: self)
  }
  
  case home
  case episodes
  case characters
  case location
}

class ViewFactory {
  @ViewBuilder static func viewForDestination(_ destination: Route) -> some View {
    switch destination {
    case .home:
      self.getHomeView()
    case .episodes:
      self.getEpisodesView()
    case .characters:
      self.getCharactersView()
    case .location:
      self.getLocationView()
    }
  }
  
  static func getHomeView() -> some View {
    let view = HomeView(viewModel: HomeViewModel())
    return view
  }
  
  static func getEpisodesView() -> some View {
    let view = EpisodesView(viewModel: EpisodesViewModel())
    return view
  }
  
  static func getCharactersView() -> some View {
    let view = CharactersView(viewModel: CharactersViewModel())
    return view
  }
  
  static func getLocationView() -> some View {
    let view = LocationView(viewModel: LocationViewModel())
    return view
  }
}
