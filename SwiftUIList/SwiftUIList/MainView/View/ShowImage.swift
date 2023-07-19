//
//  ShowImage.swift
//  SwiftUIList
//
//  Created by Uri on 18/7/23.
//

import SwiftUI

struct ShowImage: View {
    let urlString: String
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { image in image.resizable()
        } placeholder: { Color.orange } .frame(width: 96, height: 114) .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: Color.black, radius: 5)
    }
}

struct ShowImage_Previews: PreviewProvider {
    static var previews: some View {
        ShowImage(urlString: "https://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg")
    }
}
