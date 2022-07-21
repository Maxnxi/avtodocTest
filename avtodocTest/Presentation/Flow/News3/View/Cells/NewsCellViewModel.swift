//
//  NewsCellViewModel.swift
//  avtodocTest
//
//  Created by Maksim Ponomarev on 20/07/2022.
//

import Foundation
import UIKit

final class NewsCellViewModel {
    
    private let new: New
    private let newThumbnail: UIImage?
    private let networkService: NetworkServiceAwInput
    
    init(new: New, networkService: NetworkServiceAwInput = NetworkServiceAwInputImpl() ) async {
        self.new = new
        self.networkService = networkService
        
        let urlStr = new.titleImageURL
        do {
            self.newThumbnail = try await networkService.fetchThumbnail(for: urlStr)
        } catch {
            print("Error - \(error.localizedDescription)")
            self.newThumbnail = UIImage(systemName: "network")
        }
    }
    
    
    
}
