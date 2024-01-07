//
//  LocationSearchResultCell.swift
//  iUber
//
//  Created by Khondakar Afridi on 7/1/24.
//

import SwiftUI

struct LocationSearchResultCell: View {
    var body: some View {
        HStack{
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundStyle(.black)
                .tint(.white)
                .frame(width: 40, height: 40)
                .padding(.trailing, 5)
            VStack(alignment: .leading, spacing: 4){
                Text("Apple HQ")
                    .font(.body)
                Text("123 - Cupertion Street")
                    .font(.system(size: 15))
                    .foregroundStyle(.gray)
                Divider()
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    LocationSearchResultCell()
}
