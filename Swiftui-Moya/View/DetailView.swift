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
        ZStack {
            VStack {
                Spacer()
                Text(self.viewModel.advice.slip.advice)
                Spacer()
                Button("I need.") {
                    self.viewModel.fetch()
                }
                .frame(width: 100, height: 100)
                .buttonStyle(CustomButtonStyle())
                .cornerRadius(20)
                // インジケータ表示中は非活性
                .disabled(self.viewModel.isShowingIndicator)
                Button("back") {
                    self.dismiss()
                }
            }
            // インジケータの表示
            if self.viewModel.isShowingIndicator {
                VStack {
                    Spacer()
                    ActivityIndicator()
                        .frame(width: 100, height: 100)
                        .background(.gray.opacity(0.8))
                        .clipped(antialiased: true)
                        .cornerRadius(12)
                    Spacer()
                }
            }
        }
        .onDisappear {
            // 画面が閉じるときの処理
            self.text = self.viewModel.advice.slip.advice
        }
    }
}
