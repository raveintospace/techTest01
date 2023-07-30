//
//  ShowViewModel.swift
//  SwiftUIList
//
//  Created by Uri on 17/7/23.
//

import Foundation

class ShowViewModel: ObservableObject {
    @Published var showList = [Show]()
    @Published var page = 0             // last page 280
    @Published var pagesEnded = false
    
    func getShows() async {        
        guard let url = URL(string: Constants.showListURL+"\(page)") else { return }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            if (response as? HTTPURLResponse)?.statusCode == 200 {
                print("status code 200")
                
                let receivedShowList = try JSONDecoder().decode([   Show].self, from:  data)
                self.showList += receivedShowList
                self.page += 1
                print("response count: \(receivedShowList.count)")
                print("page value: \(self.page)")
            }
            
            else if (response as? HTTPURLResponse)?.statusCode == 404 {
                print("error 404 - show alert: -no more shows available-")
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.pagesEnded.toggle()
                }
                
            }
            
        } catch {
            print("error: ", error)
        }
    }
}
