//
//  News2ListViewModel.swift
//  avtodocTest
//
//  Created by Maksim Ponomarev on 15/07/2022.
//

import Foundation

class News2ListViewModel: ObservableObject {
    
    var currentPage: Int
    
    private let networkServiceAwait: NetworkServiceAwInput
    
    @Published private(set) var news: [New] = []
    
    init(networkService: NetworkServiceAwInput = NetworkServiceAwInputImpl()) {
        currentPage = 1
        self.networkServiceAwait = networkService
    }
    
    func getNews(for page: Int) async {
        do {
            let news = try await networkServiceAwait.getNews(for: page)
            currentPage += 1
            self.news.append(contentsOf: news)
        } catch {
            print("Error = ", error)
        }
        
    }
    
}
