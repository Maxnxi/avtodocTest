//
//  NewRepoImpl.swift
//  avtodocTest
//
//  Created by Maksim Ponomarev on 11/07/2022.
//

import Foundation
import Combine

class NewRepoImpl : NewRepo {
    
    private let remoteDataSource: NewRemoteDataSource
    
    init(remoteDataSource: NewRemoteDataSource = NewRemoteDataSource()) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getNewsPerPage(page: Int) -> AnyPublisher<[New], Error> {
        return remoteDataSource.getNews(page: page).map {
            serverNew -> [New] in
            debugPrint("get response")
            var news: [New] = []
            for new in serverNew.news {
                let newEnt = new.convertToEntity()
                news.append(newEnt)
            }
            return news
        }
        .mapError({ $0 })
        .eraseToAnyPublisher()
    }
    
    
}
