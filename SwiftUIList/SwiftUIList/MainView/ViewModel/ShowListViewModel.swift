//
//  ShowListViewModel.swift
//  SwiftUIList
//
//  Created by Uri on 17/7/23.
//

import Foundation

class ShowListViewModel: ObservableObject {
    
    @Published var showList = [Show]()
    
    func callToApi() async {
        guard let url = URL(string: Constants.showListURL) else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let response = try? JSONDecoder().decode([Show].self, from: data) {
                DispatchQueue.main.async {
                    self.showList = response
                    print(response.count)
                }
            }
        } catch {
            print("error: ", error)
        }
    }
}
