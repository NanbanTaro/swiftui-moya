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
    private let service = APIService()
    private var cancellables = Set<AnyCancellable>()

    func fetch() {
        self.service.fetchAdvice().sink(
            receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print(error)
                case .finished:
                    print("ok")
                }
            },
            receiveValue: { myModel in
                print(myModel)
            }
        )
        .store(in: &cancellables)
    }
}
