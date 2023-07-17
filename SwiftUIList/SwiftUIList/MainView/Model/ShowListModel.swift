//
//  ShowListModel.swift
//  SwiftUIList
//
//  Created by Uri on 17/7/23.
//

import Foundation

struct ShowListModel: Decodable {
    let id: Int
    let url: String
    let name: String
    let summary: String
    //let rating: Rating
}

struct Rating: Decodable {
    let average: Double
}


