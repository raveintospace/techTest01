//
//  LocalDataSourceMock.swift
//  SwiftUIListTests
//
//  Created by Uri on 20/8/23.
//

import Foundation
import Combine
@testable import SwiftUIList

class LocalDataSourceMock: LocalDataSourcing {
    var isPersistShowsCalled = false
    var isObserveShowsCalled = false
    
    var shows: [Show] = []
    
    func persistShows(shows: [Show]) {
        isPersistShowsCalled = true
        self.shows = shows
    }
    
    func observeShows() -> AnyPublisher<[Show], Error> {
        isObserveShowsCalled = true
        return CurrentValueSubject<[Show], Error>([]).eraseToAnyPublisher()
    }
    
    
}
