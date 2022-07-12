//
//  NewRepo.swift
//  avtodocTest
//
//  Created by Maksim Ponomarev on 11/07/2022.
//

import Foundation
import Combine

protocol NewRepo {
    
    func getNewsPerPage(page: Int) -> AnyPublisher<[New], Error>
}




