//
//  LocationSearchActivationView.swift
//  iUber
//
//  Created by Khondakar Afridi on 7/1/24.
//

import SwiftUI

struct LocationSearchActivationView: View {
    var body: some View {
        HStack{
            Rectangle()
                .fill(.black)
                .frame(width: 8, height: 8)
                .padding(.horizontal)
            Text("Where to?")
                .foregroundStyle(Color(.darkGray))
            Spacer()
        }
        .padding(.vertical, 11)
        .background(
            Rectangle()
                .fill(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .shadow(color: .gray, radius: 6)
        )
    }
}

#Preview {
    LocationSearchActivationView()
}
