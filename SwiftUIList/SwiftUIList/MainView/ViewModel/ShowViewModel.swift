//
//  ShowViewModel.swift
//  SwiftUIList
//
//  Created by Uri on 17/7/23.
//

import Foundation

class ShowViewModel: ObservableObject {
    @Published var showList = [Show]()
    @Published var page = 300
    
    func getShows() async {
        guard let url = URL(string: Constants.showListURL+"\(page)") else { return }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Status Code is not 200") }
            
            let oldShowList = self.showList
            
            if let receivedShowList = try? JSONDecoder().decode([Show].self, from: data) {
                DispatchQueue.main.async {
                    self.showList = oldShowList + receivedShowList
                    print("response count: \(receivedShowList.count)")
                    self.page += 1
                    print("page value: \(self.page)")
                }
            }
        } catch {
            print("error: ", error.localizedDescription)
        }
    }
}
