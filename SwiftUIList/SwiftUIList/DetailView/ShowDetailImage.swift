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
        AsyncImage(url: URL(string: urlString)) { image in image.resizable()
        } placeholder: { Color.orange } .frame(width: 96, height: 114) .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: Color.black, radius: 5)
    }
}

struct ShowDetailImage_Previews: PreviewProvider {
    static var previews: some View {
        ShowDetailImage(urlString: "https://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg")
    }
}
