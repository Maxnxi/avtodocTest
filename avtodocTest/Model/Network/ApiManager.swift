//
//  ApiManager.swift
//  avtodocTest
//
//  Created by Maksim Ponomarev on 11/07/2022.
//

import Foundation
import Combine

class ApiManager {
    //var baseURL: URL
    var session: URLSession
    
    private let decoder = JSONDecoder()
    private let customQueue = DispatchQueue(label: "API")
    
    /*,
                                            qos: .userInitiated, attributes: .concurrent
                                            , autoreleaseFrequency: .workItem,
                                            target: .global())
     */
    init(/*baseURL: String,*/ session: URLSession = URLSession.shared) {
        //self.baseURL = URL(string: baseURL)!
        self.session = session
    }
    
    func performRequest<T: Decodable>(urlRequest: URLRequest) -> AnyPublisher<T, Error> {
        
        return session.dataTaskPublisher(for: urlRequest)
            .receive(on: customQueue)
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw HTTPError.invalidResponse
                }
                let statusCode = httpResponse.statusCode
                
                guard (200..<300).contains(statusCode) else {
                    throw HTTPError.invalidStatusCode
                }
                print("Get data = ", data)
                return data
            }
            .decode(type: T.self, decoder: decoder)
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
