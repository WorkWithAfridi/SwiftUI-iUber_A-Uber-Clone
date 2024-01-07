//
//  HomeView.swift
//  iUber
//
//  Created by Khondakar Afridi on 7/1/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        UberMapViewRepresentable()
            .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
