//
//  ServerBaseResponse.swift
//  avtodocTest
//
//  Created by Maksim Ponomarev on 11/07/2022.
//

import Foundation

struct ServerBaseResponse<T: Codable>: Codable {
    let result: T
}
