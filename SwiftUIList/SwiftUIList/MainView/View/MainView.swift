//
//  MainView.swift
//  SwiftUIList
//
//  Created by Uri on 17/7/23.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = ShowListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(viewModel.showList, id: \.id) {
                        show in
                        HStack{
                            Image(systemName: "person.fill")
                            Text(show.name)
                        }
                    }
                }.onAppear {
                    Task {
                        await viewModel.callToApi()
                    }
                }
            }
            .navigationTitle("TV Shows list")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
