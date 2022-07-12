//
//  HTTPError.swift
//  avtodocTest
//
//  Created by Maksim Ponomarev on 11/07/2022.
//

import Foundation

enum HTTPError: LocalizedError, Equatable {
    case invalidResponse
    case invalidStatusCode
}
