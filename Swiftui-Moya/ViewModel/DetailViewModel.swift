//
//  DetailViewModel.swift
//  Swiftui-Moya
//
//  Created by NanbanTaro on 2023/04/19.
//  
//

import Foundation
import Combine

final class DetailViewModel: ObservableObject {

    @Published var advice = AdviceModel(slip: Slip())

    private let APIservice: APIServiceProtocols
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Init

    init() {
        self.APIservice = APIService()
    }

    // MARK: - Function

    func fetch() {
        self.APIservice.fetchAdvice().sink(
            receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print(error)
                case .finished:
                    // TODO: インジケータを表示する
                    print("ok")
                }
            },
            receiveValue: { myModel in
                self.advice = myModel
            }
        )
        .store(in: &cancellables)
    }
}
