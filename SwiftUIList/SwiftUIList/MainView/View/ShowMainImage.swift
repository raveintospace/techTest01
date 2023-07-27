//
//  ShowMainImage.swift
//  SwiftUIList
//
//  Created by Uri on 18/7/23.
//

import SwiftUI

struct ShowMainImage: View {
    let urlString: String
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { phase in
            switch phase {
            case .success (let imageToShow): imageToShow.resizable()
            default: Image("placeholderImg")
                    .font(.largeTitle)
            }
        }
        .frame(width: 96, height: 120) .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct ShowImage_Previews: PreviewProvider {
    static var previews: some View {
        ShowMainImage(urlString: "https://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg")
    }
}
