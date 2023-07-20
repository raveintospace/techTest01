//
//  ShowMainView.swift
//  SwiftUIList
//
//  Created by Uri on 17/7/23.
//

import SwiftUI

struct ShowMainView: View {
    @ObservedObject var viewModel = ShowViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(viewModel.showList, id: \.id) {
                        show in
                        NavigationLink(destination: ShowDetailView()) {
                            HStack(spacing: 20){
                                ShowImage(urlString: show.image.original)
                                Text(show.name)
                                    .font(.title2)
                            }
                        }
                    }
                }.onAppear {
                    Task {
                        await viewModel.getShows()
                    }
                }
            }
            .navigationTitle("TV Shows list")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ShowMainView()
    }
}

// AsyncImage(url: URL(string: "https://hws.dev/paul.jpg"))
