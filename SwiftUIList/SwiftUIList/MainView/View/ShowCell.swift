//
//  ShowCell.swift
//  SwiftUIList
//
//  Created by Uri on 22/7/23.
//

import SwiftUI

struct ShowCell: View {
    let show: Show
    var isLast: Bool
    @ObservedObject var viewModel: ShowViewModel
    
    var body: some View {
        NavigationLink(destination: ShowDetailView(show: show)) {
            HStack(spacing: 20){
                ShowMainImage(urlString: show.image.original)
                Text(show.name)
                    .font(.title2)
                
                if self.isLast == true {
                    ProgressView()
                        .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            print("load more data")
                            Task {
                                await self.viewModel.getShows()
                            }
                        }
                    }
                }
            }
        }
    }
}


