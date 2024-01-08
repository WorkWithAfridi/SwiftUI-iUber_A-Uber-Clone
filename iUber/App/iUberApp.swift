//
//  iUberApp.swift
//  iUber
//
//  Created by Khondakar Afridi on 7/1/24.
//

import SwiftUI

@main
struct iUberApp: App {
    @StateObject private var routeManager: RouteManger = RouteManger()
    @StateObject private var locationSearchViewModel: LocationSearchViewModel = LocationSearchViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $routeManager.path) {
                HomeView()
                    .navigationDestination(for: Route.self) { route in
                        GetView(route: route)
                    }
            }
        }
        .environmentObject(locationSearchViewModel)
        .environmentObject(locationSe)
    }
}
