//
//  MainView.swift
//  SwiftUIList
//
//  Created by Uri on 17/7/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack{
                    Image(systemName: "person.fill")
                    Text("TV Show title")
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
