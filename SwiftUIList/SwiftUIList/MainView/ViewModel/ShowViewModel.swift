//
//  ShowViewModel.swift
//  SwiftUIList
//
//  Created by Uri on 17/7/23.
//

import Foundation

class ShowViewModel: ObservableObject {
    @Published var showList = [Show]()
    @Published var page = 0
    
    func getShows() async {
        guard let url = URL(string: Constants.showListURL+"\(page)") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let oldShowList = self.showList
            
            if let response = try? JSONDecoder().decode([Show].self, from: data) {
                DispatchQueue.main.async {
                    self.showList = oldShowList + response
                    print("response count: \(response.count)")
                    self.page += 1
                    print("page value: \(self.page)")
                }
            }
        } catch {
            print("error: ", error.localizedDescription)
        }
    }
}
