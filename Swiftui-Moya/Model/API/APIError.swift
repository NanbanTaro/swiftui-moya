//
//  APIError.swift
//  Swiftui-Moya
//
//  Created by NanbanTaro on 2023/04/21.
//  
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse(Data, HTTPURLResponse)
    case decodingError(DecodingError)
    case genericError(Error)
}
