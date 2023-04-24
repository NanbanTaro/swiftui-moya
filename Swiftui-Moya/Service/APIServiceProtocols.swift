//
//  APIServiceProtocols.swift
//  Swiftui-Moya
//
//  Created by NanbanTaro on 2023/04/21.
//  
//

import Combine

protocol APIServiceProtocols: AnyObject {

    func fetchAdvice() -> AnyPublisher<AdviceModel, Error>
}
