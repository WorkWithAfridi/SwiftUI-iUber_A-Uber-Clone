//
//  LocationSearchResultCell.swift
//  iUber
//
//  Created by Khondakar Afridi on 7/1/24.
//

import SwiftUI

struct LocationSearchResultCell: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack{
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundStyle(.black)
                .tint(.white)
                .frame(width: 40, height: 40)
                .padding(.trailing, 5)
            VStack(alignment: .leading, spacing: 4){
                Text(title)
                    .font(.body)
                Text(subtitle)
                    .font(.system(size: 15))
                    .foregroundStyle(.gray)
                Divider()
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    LocationSearchResultCell(
        title: "Hello World",
        subtitle: "Hello description"
    )
}
