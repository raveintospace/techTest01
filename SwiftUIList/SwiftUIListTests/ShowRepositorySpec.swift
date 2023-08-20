//
//  ShowRepositorySpec.swift
//  SwiftUIListTests
//
//  Created by Uri on 20/8/23.
//

import XCTest
@testable import SwiftUIList

final class ShowRepositorySpec: XCTestCase {
    
    func testFetchShows() async throws {
        // GIVEN
        let shows = [
            Show(id: 345, name: "dhjudghj", summary: nil, rating: Show.Rating(average: 3), image: nil),
            Show(id: 234, name: "sfghdfghdf", summary: nil, rating: Show.Rating(average: 3), image: nil),
            Show(id: 456, name: "kghjkghjk", summary: nil, rating: Show.Rating(average: 3), image: nil),
            Show(id: 567, name: "astastr", summary: nil, rating: Show.Rating(average: 3), image: nil)
        ]
        
        let remote = RemoteDataSourceMock(shows: shows)
        let local = LocalDataSourceMock()
        let sut = ShowRepository(local: local, remote: remote)
        
        // WHEN
        try await sut.fetchShows(page: 99)
        
        // THEN
        XCTAssertTrue(remote.isFetchShowsCalled)
        XCTAssertTrue(local.isPersistShowsCalled)
        XCTAssertEqual(remote.pages, 99)
        XCTAssertEqual(shows, local.shows)
    }
    
    func testObserveShows() throws {
        // GIVEN
        let local = LocalDataSourceMock()
        let sut = ShowRepository(local: local)
        
        // WHEN
        sut.observeShows()
        
        // THEN
        XCTAssertTrue(local.isObserveShowsCalled)
    }
}
