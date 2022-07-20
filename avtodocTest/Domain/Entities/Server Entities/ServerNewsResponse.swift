//
//  ServerNewsResponse.swift
//  avtodocTest
//
//  Created by Maksim Ponomarev on 11/07/2022.
//

import Foundation

struct ServerNewsResponse: Codable {
    
    let news: [ServerNew]
    let totalCount: Int
    
}

struct ServerNew: Codable {
    let id: Int
    let title, newsDescription, publishedDate, url: String
    let fullURL: String
    let titleImageURL: String?
    let categoryType: CategoryType

    enum CodingKeys: String, CodingKey {
        case id, title
        case newsDescription = "description"
        case publishedDate, url
        case fullURL = "fullUrl"
        case titleImageURL = "titleImageUrl"
        case categoryType
    }
    
    func convertToEntity() -> New {
        return New(id: id,
                   title: title,
                   newsDescription: newsDescription,
                   publishedDate: publishedDate,
                   url: url,
                   fullURL: fullURL,
                   titleImageURL: titleImageURL ?? "",
                   categoryType: categoryType.rawValue)
    }
    
}

enum CategoryType: String, Codable {
    case автомобильныеНовости = "Автомобильные новости"
    case новостиКомпании = "Новости компании"
}
