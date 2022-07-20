//
//  NewsListViewModel.swift
//  avtodocTest
//
//  Created by Maksim Ponomarev on 11/07/2022.
//

import Foundation
import SwiftUI
import Combine

class NewsListViewModel: ObservableObject {
    
    @Published private(set) var news: [New] = []
    
    var currentPage = 1
    
    private var cancellable: AnyCancellable?
    
    func getNewsForPage(_ page: Int) {
        cancellable = GetNewsForPageUseCase().execute(page: page)
            .receive(on: DispatchQueue.main)
            .sink { [weak self]
                completion in
                switch completion {
                case .finished:
                    debugPrint("Something received from server")
                    print("Current page is = ", self?.currentPage)
                    self?.currentPage += 1
                    print("current page is = ", self?.currentPage)
                    break
                case .failure:
                    print("Something broken")
                    self?.currentPage += 1
                    break
                }
            } receiveValue: { news in
                debugPrint("news count = ", news.count
                )
                self.news.append(contentsOf: news)
            }

        
    }
}
