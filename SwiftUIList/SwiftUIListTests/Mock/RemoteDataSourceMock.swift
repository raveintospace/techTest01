//
//  RemoteDataSourceMock.swift
//  SwiftUIListTests
//
//  Created by Uri on 20/8/23.
//

import Foundation
@testable import SwiftUIList

class RemoteDataSourceMock: RemoteDataSourcing {
    var pages = 0
    var isFetchShowsCalled = false
    private let shows: [Show]
    
    init(shows: [Show] = []) {
        self.shows = shows
    }
    
    func fetchShows(page: Int) async throws -> [Show] {
        pages = page
        isFetchShowsCalled = true
        return shows
    }
}
