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
                .frame(width: 350)
                .frame(height: 350)
        }
        .safeAreaInset(edge: .bottom) {
            VStack{
                Text("Created by")
                    .fontWeight(.heavy)
                    .foregroundColor(Color("YellowText"))
                    .padding(.bottom, -3)
                Image("logo_U46")
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            .padding(10)
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
