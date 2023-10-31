//
//  LocationView.swift
//  paths
//
//  Created by N S on 31.10.2023.
//

import SwiftUI

class LocationViewModel: ObservableObject {
    
}

struct LocationView: View {
    @StateObject var viewModel: LocationViewModel
    @EnvironmentObject var coordinator: BaseCoordinator
    var body: some View {
        Text("Location")
        Button(action: {
            goHome()
        }, label: {
            Text("home")
        })
    }
    
    func goHome() {
        coordinator.goToRoot()
    }
}


