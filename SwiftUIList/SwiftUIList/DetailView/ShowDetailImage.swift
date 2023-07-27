//
//  ShowDetailImage.swift
//  SwiftUIList
//
//  Created by Uri on 20/7/23.
//

import SwiftUI

struct ShowDetailImage: View {
    let urlString: String
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { phase in
            switch phase {
            case .success (let imageToShow): imageToShow.resizable()
            default: Image("placeholderImgBig")
                    .font(.largeTitle)
            }
        }
        .frame(width: 240, height: 300) .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct ShowDetailImage_Previews: PreviewProvider {
    static var previews: some View {
        ShowDetailImage(urlString: "https://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg")
    }
}
