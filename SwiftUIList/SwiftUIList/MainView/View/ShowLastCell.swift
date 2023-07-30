//
//  ShowCell.swift
//  SwiftUIList
//
//  Created by Uri on 22/7/23.
//

import SwiftUI

struct ShowLastCell: View {
    var body: some View {
        HStack(spacing: 20){
            ShowMainImage(urlString: "")
            Text("Loading...")
                .font(.title2)
        }
    }
}

struct ShowLastCell_Previews: PreviewProvider {
    static var previews: some View {
        ShowLastCell()
    }
}
