//
//  MainViewModel.swift
//  Swiftui-Moya
//
//  Created by NanbanTaro on 2023/04/19.
//  
//

import Foundation

final class MainViewModel: ObservableObject {

    @Published var isShowingModalView: Bool = false

    // MARK: - Function

    func changeIsShowingModalView() {
        self.isShowingModalView.toggle()
    }
}
