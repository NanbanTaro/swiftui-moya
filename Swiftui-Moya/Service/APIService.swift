//
//  APIService.swift
//  Swiftui-Moya
//
//  Created by NanbanTaro on 2023/04/19.
//  
//

import Combine
import CombineMoya
import Foundation
import Moya

final class APIService {

    let provider = MoyaProvider<AdviceAPI>()
}

// MARK: - APIServiceProtocols

extension APIService: APIServiceProtocols {

    func fetchAdvice() -> AnyPublisher<AdviceModel, Error> {
        return self.provider
            .requestPublisher(.advice)
            .tryMap { response in
                guard (200...299).contains(response.statusCode) else {
                    throw APIError.invalidResponse(response.data, response.response!)
                }
                return response.data
            }
            .decode(type: AdviceModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
