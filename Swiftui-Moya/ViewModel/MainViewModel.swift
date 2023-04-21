//
//  MainViewModel.swift
//  Swiftui-Moya
//
//  Created by NanbanTaro on 2023/04/19.
//  
//

import Foundation

final class MainViewModel: ObservableObject {

    @Published var hoge = [String]()
    @Published var isShowingModalView: Bool = false
    @Published var text: String = "遷移先を選んでね"

    // MARK: - Function

    func changeText(text: String) {
        self.text = text
    }

    func changeIsShowingModalView() {
        isShowingModalView.toggle()
    }
}
