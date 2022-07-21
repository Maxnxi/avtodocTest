//
//  NetworkServiceAwait.swift
//  avtodocTest
//
//  Created by Maksim Ponomarev on 15/07/2022.
//

import Foundation
import UIKit

protocol NetworkServiceAwInput: AnyObject {
    func getNews(for page: Int) async throws -> [New]
    func fetchThumbnail(for id: String) async throws -> UIImage
}

class NetworkServiceAwInputImpl: NetworkServiceAwInput {
    
    private let decoder = JSONDecoder()
    private let urlConstant: UrlConstants
    
    init(urlConstant: UrlConstants = UrlConstants() ) {
        //self.baseURLString = baseURL
        self.urlConstant = urlConstant
    }
    
    func getNews(for page: Int) async throws -> [New] {
        let urlRequest = getNewsUrlRequest(for: page, urlConstants: urlConstant)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw HTTPError.invalidResponse
        }
        let statusCode = httpResponse.statusCode
        guard (200..<300).contains(statusCode) else {
            throw HTTPError.invalidStatusCode
        }
        let decodedData = try decoder.decode(ServerNewsResponse.self, from: data)
        let news = decodedData.news.map({ $0.convertToEntity() })
        return news
        
    }
    
    func fetchThumbnail(for urlStr: String) async throws -> UIImage {
        let url = URL(string: urlStr)!
        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw HTTPError.invalidStatusCode }
        let img = UIImage(data: data)
        guard let thumbnail = img else { throw HTTPError.invalidResponse }
        return thumbnail
    }

    
    
}
extension NetworkServiceAwInputImpl {
    func getNewsUrlRequest(for page: Int, urlConstants: UrlConstants) -> URLRequest {
        var components = URLComponents()
        components.scheme = urlConstants.scheme
        components.host = urlConstants.host
        components.path = urlConstants.path+"/\(page)/15"
        debugPrint("URL is = ", components.url!)
        let urlRequest = URLRequest(url: components.url!)
        return urlRequest
    }
}
