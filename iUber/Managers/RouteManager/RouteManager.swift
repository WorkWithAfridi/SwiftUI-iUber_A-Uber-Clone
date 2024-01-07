//
//  RouteManager.swift
//  iUber
//
//  Created by Khondakar Afridi on 7/1/24.
//

import Foundation
import SwiftUI


class RouteManger : ObservableObject {
    @Published var path = NavigationPath()
    
    func popToRoot(){
        path = NavigationPath()
    }
    
    func to(route : Route){
        path.append(route)
    }
    
    func pop(){
        path.removeLast()
    }
    
    func popNViews(N: Int){
        path.removeLast(N)
    }
}


struct GetView: View {
    var route: Route
    var body: some View {
        switch route {
        case .homeView:
            HomeView()
        case .locationSearchView:
            LocationSearchView()
        default:
            ContentUnavailableView("404", systemImage: "globe", description: Text("Invalid route! :(").font(.footnote))
        }
    }
}
