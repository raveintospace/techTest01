//
//  LocalDataSource.swift
//  SwiftUIList
//
//  Created by Uri on 30/7/23.
//

import Foundation
import Combine

final class LocalDataSource {
    private let shows = CurrentValueSubject<[Show], Error>([])
    
    func persistShows(shows: [Show]) {
        self.shows.send(self.shows.value + shows)
    }
    
    func observeShows() -> AnyPublisher<[Show], any Error> {
        shows.eraseToAnyPublisher()
    }
}
