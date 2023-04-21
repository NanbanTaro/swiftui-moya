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
    @ObservedObject var viewModel: DetailViewModel
    @Binding var text: String

    var body: some View {
        VStack {
            Text(self.text)
            Button("戻る") {
                viewModel.fetch()
                dismiss()
            }
        }
    }
}
