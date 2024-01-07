//
//  MapViewActionButton.swift
//  iUber
//
//  Created by Khondakar Afridi on 7/1/24.
//

import SwiftUI

struct MapViewActionButton: View {
    var body: some View {
        Image(systemName: "line.3.horizontal")
            .font(.title2)
            .foregroundStyle(.black)
            .padding()
            .background(.white)
            .clipShape(Circle())
            .shadow(color: .gray, radius: 10)
    }
}

#Preview {
    MapViewActionButton()
}
