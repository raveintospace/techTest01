//
//  LocalDataSource.swift
//  SwiftUIList
//
//  Created by Uri on 30/7/23.
//

import Foundation
import Combine

protocol LocalDataSourcing {
    func persistShows(shows: [Show])
    func observeShows() -> AnyPublisher<[Show], any Error>
}

final class LocalDataSource: LocalDataSourcing {
    private let shows = CurrentValueSubject<[Show], Error>([])
    
    func persistShows(shows: [Show]) {
        self.shows.send(self.shows.value + shows)
    }
    
    func observeShows() -> AnyPublisher<[Show], any Error> {
        shows.eraseToAnyPublisher()
    }
}
