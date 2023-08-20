//
//  ShowRepository.swift
//  SwiftUIList
//
//  Created by Uri on 30/7/23.
//

import Foundation
import Combine

protocol ShowRepositoring {
    func fetchShows(page: Int) async throws
    func observeShows() -> AnyPublisher<[Show], any Error>
}

struct ShowRepository: ShowRepositoring {
    private let local: LocalDataSourcing
    private let remote: RemoteDataSourcing
    
    init(local: LocalDataSourcing = LocalDataSource(), remote: RemoteDataSourcing = RemoteDataSource()) {
        self.local = local
        self.remote = remote
    }
    
    func fetchShows(page: Int) async throws {
        let shows = try await remote.fetchShows(page: page)
        local.persistShows(shows: shows)
    }
    
    func observeShows() -> AnyPublisher<[Show], any Error> {
        local.observeShows()
    }
}
