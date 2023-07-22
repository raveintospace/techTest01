//
//  ShowViewModel.swift
//  SwiftUIList
//
//  Created by Uri on 17/7/23.
//

import Foundation

class ShowViewModel: ObservableObject {
    @Published var showList = [Show]()
    @Published var page = 1
    
    func getShows() async {
        guard let url = URL(string: Constants.showListURL+"\(page)") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let response = try? JSONDecoder().decode([Show].self, from: data) {
                DispatchQueue.main.async {
                    self.showList = response
                    print("response count: \(response.count)")
                }
            }
        } catch {
            print("error: ", error.localizedDescription)
        }
    }
}
