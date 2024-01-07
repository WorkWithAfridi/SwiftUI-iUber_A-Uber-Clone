//
//  LocationSearchView.swift
//  iUber
//
//  Created by Khondakar Afridi on 7/1/24.
//

import SwiftUI
import UIKit

struct LocationSearchView: View {
    @State private var startLocationText = ""
    @State private var destinationLocationText = ""
    @EnvironmentObject private var routeManager: RouteManger
    var body: some View {
        VStack{
            
            HStack{
                Color(.white)
                    .overlay(
                        Image(systemName: "chevron.backward")
                    )
                    .frame(width: 40, height: 35)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                    .onTapGesture {
                        routeManager.pop()
                    }
                Spacer()
                Text("Where to?")
                    .font(.body)
                    .fontWeight(.bold)
                Spacer()
                Color(.white)
                    .frame(width: 40, height: 35)
            }
            
            HStack{
                VStack{
                    Circle()
                        .fill(.black)
                        .frame(width: 8, height: 8)
                        .padding(.horizontal)
                    
                    Rectangle()
                        .fill(.gray)
                        .frame(width: 1, height: 22)
                        .padding(.horizontal)
                    
                    Rectangle()
                        .fill(.black)
                        .frame(width: 8, height: 8)
                        .padding(.horizontal)
                }
                VStack{
                    TextField("Current location", text: $startLocationText)
                        .frame(height: 32)
                        .foregroundStyle(.black)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .cornerRadius(5)
                        .background(Color(.systemGray6))
                        .padding(.trailing)
                    
                    TextField("Destination location", text: $destinationLocationText)
                        .frame(height: 32)
                        .foregroundStyle(.black)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .cornerRadius(5)
                        .background(Color(.systemGray6))
                        .padding(.trailing)
                }
            }
            .padding(.bottom, 12)
            Divider()
            ScrollView {
                VStack(alignment: .leading){
                    ForEach(0..<20, id: \.self){
                        _ in
                        LocationSearchResultCell()
                            .padding(.vertical, 5)
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    LocationSearchView()
        .environmentObject(RouteManger())
}