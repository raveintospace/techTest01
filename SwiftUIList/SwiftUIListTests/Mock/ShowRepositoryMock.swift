//
//  ShowRepositoryMock.swift
//  SwiftUIListTests
//
//  Created by Uri on 20/8/23.
//

import Foundation
import Combine
@testable import SwiftUIList

class ShowRepositoryMock: ShowRepositoring {
    var isFetchShowsCalled = false
    var isObserveShowsCalled = false
    var fetchShowsPage = 0
    
    let willReturnError: Bool
    let shows = CurrentValueSubject<[Show], Error>([])
    
    init(willReturnError: Bool = false) {
        self.willReturnError = willReturnError
    }
    
    func fetchShows(page: Int) async throws {
        isFetchShowsCalled = true
        fetchShowsPage = page
        
        if willReturnError {
            throw NSError()
        }
    }
    
    func observeShows() -> AnyPublisher<[Show], Error> {
        isObserveShowsCalled = true
        return shows.eraseToAnyPublisher()
    }
}
