//
//  HomeView.swift
//  iUber
//
//  Created by Khondakar Afridi on 7/1/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            UberMapViewRepresentable()
                .ignoresSafeArea()
            VStack{
                HStack(alignment: .center){
                    MapViewActionButton()
                    LocationSearchActivationView()
                }
                .padding(.leading, 12)
                .padding(.trailing, 24)
                .padding(.top, 10)
                Spacer()
            }
        }
    }
}

#Preview {
    HomeView()
}
