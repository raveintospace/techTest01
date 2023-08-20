//
//  ShowModel.swift
//  SwiftUIList
//
//  Created by Uri on 17/7/23.
//

import Foundation

struct Show: Decodable, Equatable {
    let id: Int
    let name: String
    let summary: String?
    let rating: Rating
    let image: Image?
    
    struct Rating: Decodable, Equatable {
        let average: Double?
    }
    
    struct Image: Decodable, Equatable {
        let medium: String
    }
}
