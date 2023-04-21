//
//  APIService.swift
//  Swiftui-Moya
//
//  Created by NanbanTaro on 2023/04/19.
//  
//

import Combine
import Moya

final class APIService {

    let provider = MoyaProvider<AdviceAPI>()

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

enum APIError: Error {
    case invalidURL
    case invalidResponse(Data, HTTPURLResponse)
    case decodingError(DecodingError)
    case genericError(Error)
}

struct AdviceModel: Decodable {
    let slip: Slip
}

struct Slip: Decodable {
    let id: Int
    let advice: String
}

enum AdviceAPI {
    case advice
}

extension AdviceAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.adviceslip.com")!
    }

    var path: String {
        return "/advice"
    }

    var method: Moya.Method {
        return .get
    }

    var task: Moya.Task {
        return .requestPlain
    }

    var headers: [String : String]? {
        return nil
    }
}
