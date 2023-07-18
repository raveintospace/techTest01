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
        } placeholder: { Color.red } .frame(width: 128, height: 128) .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

struct ShowImage_Previews: PreviewProvider {
    static var previews: some View {
        ShowImage(urlString: "https://hws.dev/paul.jpg")
    }
}
