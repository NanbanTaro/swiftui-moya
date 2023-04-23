//
//  DetailView.swift
//  Swiftui-Moya
//
//  Created by NanbanTaro on 2023/04/19.
//  
//

import SwiftUI
import Combine

struct DetailView: View {

    @Environment(\.dismiss) var dismiss
    @Binding var text: String

    @StateObject private var viewModel: DetailViewModel = DetailViewModel()

    var body: some View {
        VStack {
            Text(self.viewModel.advice.slip.advice)
            Spacer()
            Button("I need.") {
                self.viewModel.fetch()
            }
            .frame(width: 100, height: 100)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(20)
            Button("back") {
                self.dismiss()
            }
        }
        .onDisappear {
            // 画面が閉じるときの処理
            self.text = self.viewModel.advice.slip.advice
        }
    }
}
