import XCTest
import Combine
@testable import SwiftUIList

final class ShowViewModelSpec: XCTestCase {
    private var cancellables: Set<AnyCancellable> = []

    func test_dataBindingOnInit() throws {
        // GIVEN - Preparació
        
        let repo = ShowRepositoryMock()
        let sut = ShowViewModel(showRepository: repo)
        
        // WHEN - Acció a testejar
        
        // THEN - Resultat
        
        XCTAssertTrue(repo.isObserveShowsCalled)
        XCTAssertFalse(repo.isFetchShowsCalled)
    }
    
    func test_repoHasShows() throws {
        // GIVEN - Preparació
        
        let shows = [
            Show(id: 345, name: "dhjudghj", summary: nil, rating: Show.Rating(average: 3), image: nil),
            Show(id: 234, name: "sfghdfghdf", summary: nil, rating: Show.Rating(average: 3), image: nil),
            Show(id: 456, name: "kghjkghjk", summary: nil, rating: Show.Rating(average: 3), image: nil),
            Show(id: 567, name: "astastr", summary: nil, rating: Show.Rating(average: 3), image: nil)
        ]
        
        let repo = ShowRepositoryMock()
        let sut = ShowViewModel(showRepository: repo)
        
        let expectation = XCTestExpectation(description: "State is set to populated")

        sut
            .$showList
            .dropFirst(2)
            .sink { showList in
                XCTAssertEqual(showList, shows)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        // WHEN - Acció a testejar
        
        repo.shows.send(shows)

        // THEN - Resultat
                
        wait(for: [expectation], timeout: 1)
    }
    
    func test_fetchShowsIfPagesEnded() async throws {
        // GIVEN - Preparació
        
        let repo = ShowRepositoryMock()
        let sut = ShowViewModel(pagesEnded: true, showRepository: repo)
        
        // WHEN - Acció a testejar
        
        await sut.fetchShows()

        // THEN - Resultat
        
        XCTAssertFalse(repo.isFetchShowsCalled)
    }
    
    func test_fetchShowsIfNotPagesEnded() async throws {
        // GIVEN - Preparació
        
        let repo = ShowRepositoryMock()
        let sut = ShowViewModel(pagesEnded: false, page: 99, showRepository: repo)
        
        // WHEN - Acció a testejar
        
        await sut.fetchShows()

        // THEN - Resultat
        
        XCTAssertTrue(repo.isFetchShowsCalled)
        XCTAssertEqual(repo.fetchShowsPage, 99)
    }
    
    func test_fetchShowsIfNotPagesEndedAndWeGetAnError() async throws {
        // GIVEN - Preparació
        
        let repo = ShowRepositoryMock(willReturnError: true)
        let sut = ShowViewModel(pagesEnded: false, showRepository: repo)
        
        let expectation = XCTestExpectation(description: "State is set to populated")

        sut
            .$pagesEnded
            .dropFirst()
            .sink { ended in
                XCTAssertTrue(ended)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        // WHEN - Acció a testejar
        
        await sut.fetchShows()

        // THEN - Resultat
        
        XCTAssertTrue(repo.isFetchShowsCalled)
        
        wait(for: [expectation], timeout: 1)
    }
}
