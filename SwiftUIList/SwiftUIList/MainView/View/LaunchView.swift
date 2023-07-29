//
//  LaunchView.swift
//  SwiftUIList
//
//  Created by Uri on 29/7/23.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
        ZStack{
            Color("OrangeApp")
                .ignoresSafeArea()
            Image("launchImage")
                .resizable()
                .frame(width: 300)
                .frame(height: 300)
        }
        .safeAreaInset(edge: .bottom) {
            VStack{
                Text("Created by")
                    .fontWeight(.heavy)
                    .foregroundColor(.yellow)
                Image("logo_U46")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            .padding(5)
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
