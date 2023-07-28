//
//  ShowMainView.swift
//  SwiftUIList
//
//  Created by Uri on 17/7/23.
//

import SwiftUI

struct ShowMainView: View {
    @ObservedObject var viewModel = ShowViewModel()
    @State var pagesEnded = false
    
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
            .navigationTitle("TV Shows List")
            
            if viewModel.pagesEnded {
                Button(action: {
                    pagesEnded = true
                }, label: {
                    Text("Server error \n Click here for more info").lineLimit(nil)
                })
                .padding(.vertical, 10)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle)
                .tint(.red)
                .alert(isPresented: $pagesEnded) {
                    Alert(title: Text("No more shows available"), dismissButton: .default(Text("OK")))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ShowMainView(pagesEnded: false)
    }
}

