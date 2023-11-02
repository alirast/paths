import SwiftUI

final class LocationViewModel: ObservableObject {
  
}

struct LocationView: View {
  @StateObject var viewModel: LocationViewModel
  @EnvironmentObject var coordinator: BaseCoordinator
  var body: some View {
    Text("Location \(coordinator.location)")
    Button(action: {
      goHome()
    }, label: {
      Text("Show home view")
    })
  }
  
  private func goHome() {
    coordinator.goToRoot()
  }
}


