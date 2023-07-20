//
//  ShowDetailView.swift
//  SwiftUIList
//
//  Created by Uri on 20/7/23.
//

import SwiftUI

struct ShowDetailView: View {
    //var show: Show
    
    var body: some View {
        VStack(spacing: 15) {
            Image(systemName: "person.fill")
            Spacer()
            Text("Show name")
                .font(.title)
                .bold()
            Text("Show rating")
            Text("Show summary")
            Spacer()
        }
    }
}

struct ShowDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ShowDetailView()
    }
}
