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
        VStack(spacing: 20) {
            Text(show.name)
                .font(.title)
                .fontWeight(.heavy)
                .underline()
                .lineLimit(1)
                .scaledToFill()
                .minimumScaleFactor(0.5)
            ShowDetailImage(urlString: show.image.original)
        }
        .padding(.bottom, 30)
        .padding(.horizontal, 10)
        
        Spacer()
        
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Text("Rating: ")
                    .bold()
                + Text("8.9")
            }
            ScrollView {
                Text("Summary: ")
                    .bold()
                + Text(show.summary.removeHTMLTags())
            }
            .lineLimit(nil)
        }
        .padding(.horizontal, 10)
        
        Spacer()
    }
}

//struct ShowDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShowDetailView(show: Show(id: 1, name: "Show title", summary: "a story about a rat", rating: "\(5.0)", image: "https://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg"))
//    }
//}
