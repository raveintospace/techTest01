//
//  ShowModel.swift
//  SwiftUIList
//
//  Created by Uri on 17/7/23.
//

import Foundation

struct Show: Decodable {
    let id: Int
    let name: String
    let summary: String
    let rating: Rating
    let image: Image?
    
    struct Rating: Decodable {
        let average: Double?
    }
    
    struct Image: Decodable {
        let original: String
    }
}




