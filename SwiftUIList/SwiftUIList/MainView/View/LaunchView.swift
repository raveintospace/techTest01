//
//  LaunchView.swift
//  SwiftUIList
//
//  Created by Uri on 29/7/23.
//

import SwiftUI

struct LaunchView: View {
    @State var isActive = false
    
    var body: some View {
        ZStack{
            if self.isActive {
                ShowMainView()
            } else {
                Color("OrangeApp")
                    .ignoresSafeArea()
                Image("launchImage")
                    .resizable()
                    .frame(width: 350)
                    .frame(height: 350)
                    .safeAreaInset(edge: .bottom) {
                        VStack{
                            Text("Created by")
                                .fontWeight(.heavy)
                                .foregroundColor(Color("YellowText"))
                                .padding(.bottom, -3)
                            Image("logo_U46")
                                .resizable()
                                .frame(width: 60, height: 60)
                        }
                        .padding(10)
                    }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
