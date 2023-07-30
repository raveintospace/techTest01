//
//  ShowRepository.swift
//  SwiftUIList
//
//  Created by Uri on 30/7/23.
//

import Foundation
import Combine

struct ShowRepository {
    private let local: LocalDataSource
    private let remote: RemoteDataSource
    
    init(local: LocalDataSource = LocalDataSource(), remote: RemoteDataSource = RemoteDataSource()) {
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
