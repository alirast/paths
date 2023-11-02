import SwiftUI

@main
struct pathsApp: App {
  
  @ObservedObject var coordinator = BaseCoordinator()
  
  var body: some Scene {
    
    WindowGroup {
      
      NavigationStack(path: $coordinator.path) {
        ZStack {
          appContent()
        }
        
        .navigationDestination(for: Route.self) { destination in
          ViewFactory.viewForDestination(destination)
        }
      }
      .environmentObject(coordinator)
      
    }
  }
  
  @ViewBuilder func appContent() -> some View {
    ViewFactory.getHomeView()
  }
}
