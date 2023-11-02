import SwiftUI

final class HomeViewModel: ObservableObject {
  
}

struct HomeView: View {
  //general object for all the views
  @EnvironmentObject var coordinator: BaseCoordinator
  //object for this view without double after calling
  @StateObject var viewModel: HomeViewModel
  var body: some View {
    Button(action: {
      showEpisodes()
    }, label: {
      Text("Show episodes")
    })
  }
  
  private func showEpisodes() {
    coordinator.goToEpisodes()
  }
}


