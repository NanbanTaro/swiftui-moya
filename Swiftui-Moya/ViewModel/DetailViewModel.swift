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
    @Published var isShowingIndicator: Bool = false

    private let APIservice: APIServiceProtocols
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Init

    init() {
        self.APIservice = APIService()
    }

    // MARK: - Function

    func fetch() {
        self.isShowingIndicator = true

        self.APIservice.fetchAdvice().sink(
            receiveCompletion: { result in
                self.isShowingIndicator = false
                switch result {
                case .failure(let error):
                    print(error)
                case .finished:
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
