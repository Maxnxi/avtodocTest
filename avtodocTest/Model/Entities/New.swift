//
//  New.swift
//  avtodocTest
//
//  Created by Maksim Ponomarev on 11/07/2022.
//

import Foundation

struct New: Identifiable, Equatable, Hashable {
    
    let id: Int
    let title, newsDescription, publishedDate, url: String
    let fullURL: String
    let titleImageURL: String
    let categoryType: String

    enum CodingKeys: String, CodingKey {
        case id, title
        case newsDescription = "description"
        case publishedDate, url
        case fullURL = "fullUrl"
        case titleImageURL = "titleImageUrl"
        case categoryType
    }
}
