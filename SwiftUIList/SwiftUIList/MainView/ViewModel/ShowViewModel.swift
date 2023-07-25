//
//  ShowViewModel.swift
//  SwiftUIList
//
//  Created by Uri on 17/7/23.
//

import Foundation

class ShowViewModel: ObservableObject {
    @Published var showList = [Show]()
    @Published var page = 281
    
    func getShows() async {
        guard let url = URL(string: Constants.showListURL+"\(page)") else { return }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            if (response as? HTTPURLResponse)?.statusCode == 200 {
                print("status code 200")
                
                let oldShowList = self.showList
                
                if let receivedShowList = try? JSONDecoder().decode([Show].self, from: data) {
                    DispatchQueue.main.async {
                        self.showList = oldShowList + receivedShowList
                        print("response count: \(receivedShowList.count)")
                        self.page += 1
                        print("page value: \(self.page)")
                    }
                }
            }
            
            else if (response as? HTTPURLResponse)?.statusCode == 404 {
                print("error 404 - show alert: -no more shows available-")
            }
            
        } catch {
            print("error: ", error.localizedDescription)
        }
    }
}
