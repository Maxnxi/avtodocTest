//
//  GetNewsForPageUseCase.swift
//  avtodocTest
//
//  Created by Maksim Ponomarev on 11/07/2022.
//

import Foundation
import Combine

class GetNewsForPageUseCase {
    private let repo: NewRepo
    
    init(repo: NewRepo = NewRepoImpl()) {
        self.repo = repo
    }
    
    func execute(page: Int) -> AnyPublisher<[New], Error> {
        repo.getNewsPerPage(page: page)
    }
}
