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
        // TODO: 必要？
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        let cancellable = provider.requestPublisher(.advice)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        print("APIコールが完了しました。")
                    case .failure(let error):
                        print("エラーが発生しました： \(error.localizedDescription)")
                    }
                },
                receiveValue: { response in
                    // レスポンスを処理
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    do {
                        let searchResult = try decoder.decode(AdviceModel.self, from: response.data)
                        print("リポジトリの数： \(searchResult.slip.advice)")
                    } catch {
                        print("デコードエラー： \(error.localizedDescription)")
                    }
                }
            )

        return self.provider
            .requestPublisher(.advice)
            .tryMap { response in
                guard (200...299).contains(response.statusCode) else {
                    throw APIError.invalidResponse(response.data, response.response!)
                }
                return response.data
            }
            .decode(type: AdviceModel.self, decoder: decoder)
            .eraseToAnyPublisher()
    }


//    func fetchAdvice() -> AnyPublisher<String, Error> {
//        let url = URL(string: "https://api.adviceslip.com/advice")!
//        return URLSession.shared.dataTaskPublisher(for: url)
//            .tryMap { data, response -> String in
//                guard let httpResponse = response as? HTTPURLResponse,
//                      httpResponse.statusCode == 200 else {
//                    throw URLError(.badServerResponse)
//                }
//                print(String(data: data, encoding: .utf8)!) // APIからのレスポンスをログに出力する
//                let decodedResponse = try JSONDecoder().decode(AdviceModel.self, from: data)
//                return decodedResponse.slip.advice
//            }
//            .eraseToAnyPublisher()
//    }


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
