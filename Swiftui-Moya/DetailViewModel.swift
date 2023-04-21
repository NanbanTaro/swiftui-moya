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
    private var cancellables: AnyCancellable?

    func fetch() {
        self.cancellables = APIService().fetchAdvice().sink(
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
    }
}
