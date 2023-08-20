//
//  RemoteDataSource.swift
//  SwiftUIList
//
//  Created by Uri on 30/7/23.
//

import Foundation

enum RemoteDataSourceError: Error {
    case noMoreShowsAvailable
    case parsing
    case unknown
}

protocol RemoteDataSourcing {
    func fetchShows(page: Int) async throws -> [Show]
}

struct RemoteDataSource: RemoteDataSourcing {
    func fetchShows(page: Int) async throws -> [Show] {
        guard let url = URL(string: Constants.showListURL+"\(page)") else { throw RemoteDataSourceError.unknown }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else { throw RemoteDataSourceError.unknown }
            
            switch statusCode {
            
            case 200:
                let receivedShowList = try JSONDecoder().decode([Show].self, from:  data)
                return receivedShowList
            case 404:
                throw RemoteDataSourceError.noMoreShowsAvailable
            default:
                throw RemoteDataSourceError.unknown
            }
            
        } catch {
            throw RemoteDataSourceError.parsing
        }
    }
}
