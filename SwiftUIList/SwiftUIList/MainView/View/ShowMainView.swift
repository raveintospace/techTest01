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
                        
                        if show.id == self.viewModel.showList.last?.id {
                            ShowCell(show: show, isLast: true, viewModel: viewModel)
                        } else {
                            ShowCell(show: show, isLast: false, viewModel: viewModel)
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
                    Text("Last")
                }
            }
        }
    }
}

