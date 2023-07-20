//
//  ShowDetailView.swift
//  SwiftUIList
//
//  Created by Uri on 20/7/23.
//

import SwiftUI

struct ShowDetailView: View {
    var show: Show
    
    var body: some View {
        VStack(spacing: 15) {
            ShowImage(urlString: show.image.original)
            Spacer()
            Text(show.name)
                .font(.title)
                .bold()
            Text("10")
            HStack {
                Text("Summary: ")
                Text(show.summary)
            }
            Spacer()
        }
    }
}

//struct ShowDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShowDetailView(show: Show(id: 1, name: "Show title", summary: "a story about a rat", rating: "\(5.0)", image: "https://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg"))
//    }
//}
