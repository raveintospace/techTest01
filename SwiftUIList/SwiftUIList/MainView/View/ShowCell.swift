//
//  ShowCell.swift
//  SwiftUIList
//
//  Created by Uri on 22/7/23.
//

import SwiftUI

struct ShowCell: View {
    let show: Show
    
    var body: some View {
        NavigationLink(destination: ShowDetailView(show: show)) {
            HStack(spacing: 20){
                ShowMainImage(urlString: show.image?.original ?? "")
                Text(show.name)
                    .font(.title2)
            }
        }
    }
}

struct ShowCell_Previews: PreviewProvider {
    static var previews: some View {
        ShowCell(show: Show(id: 0, name: "Person of interest", summary: "testtest", rating: Show.Rating(average: 5.0), image: Show.Image.init(original: "https://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg")))
    }
}
