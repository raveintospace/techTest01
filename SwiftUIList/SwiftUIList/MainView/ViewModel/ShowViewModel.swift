//
//  ShowViewModel.swift
//  SwiftUIList
//
//  Created by Uri on 17/7/23.
//

import Foundation
import Combine

class ShowViewModel: ObservableObject {
    @Published var showList: [Show]
    @Published var pagesEnded: Bool
    
    private var page: Int            // last page 280
    private let showRepository: ShowRepository
    
    private var cancellableBag = Set<AnyCancellable>()
    
    init(showList: [Show] = [Show](),
         page: Int = 0,
         pagesEnded: Bool = false,
         showRepository: ShowRepository = ShowRepository()) {
        self.showList = showList
        self.page = page
        self.pagesEnded = pagesEnded
        self.showRepository = showRepository
        binding()
    }
    
    private func binding() {
        showRepository
            .observeShows()
            .receive(on: DispatchQueue.main)
            .replaceError(with: []) //this sets Failure to Never
            .assign(to: \.showList, on: self)
            .store(in: &cancellableBag)
    }
    
    func fetchShows() async {
        if !pagesEnded {
            do {
                try await showRepository.fetchShows(page: page)
                page += 1
            } catch {
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.pagesEnded = true
                }
            }
        }
    }
}
