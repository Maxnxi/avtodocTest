//
//  NewRepoDataSource.swift
//  avtodocTest
//
//  Created by Maksim Ponomarev on 11/07/2022.
//

import Foundation
import Combine

class NewRemoteDataSource {
    
    static let getNews: String = "news/"
    //static let getPage: String = ""
    //private let baseURLString: String
    private let session: URLSession
    private let urlConstant: UrlConstants
    private let apiManager: ApiManager
    
    init(/*baseURL: String = Constants.baseURL,*/ session: URLSession = URLSession.shared, urlConstant: UrlConstants = UrlConstants() ) {
        //self.baseURLString = baseURL
        self.urlConstant = urlConstant
        self.session = session
        self.apiManager = ApiManager(session: session)
    }
    
    public func getNews(page: Int) -> AnyPublisher<ServerNewsResponse, Error> {
        let urlRequest = getCharacterDetailEndPoint(page: page, urlConstants: urlConstant)
        return apiManager.performRequest(urlRequest: urlRequest)
    }
}
extension NewRemoteDataSource {
    
    private func getCharacterDetailEndPoint(page: Int, urlConstants: UrlConstants) -> URLRequest {
        var components = URLComponents()
        components.scheme = urlConstants.scheme
        components.host = urlConstants.host
        components.path = urlConstants.path+"/\(page)/15"
        debugPrint("URL is = ", components.url!)
        let urlRequest = URLRequest(url: components.url!)
        return urlRequest
        
    }
}
