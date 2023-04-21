//
//  MainView.swift
//  Swiftui-Moya
//
//  Created by NanbanTaro on 2023/04/15.
//  
//

import SwiftUI

struct MainView: View {
    @ObservedObject private var viewModel = MainViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Text(viewModel.text)
                HStack {
                    let detailView = DetailView(viewModel: DetailViewModel(),
                                                text: $viewModel.text)
                    NavigationLink(destination: detailView) {
                        Text("プッシュ遷移")
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        viewModel.changeText(text: "プッシュ遷移だよ")
                    })
                    Button("モーダル遷移") {
                        viewModel.changeText(text: "モーダル遷移だよ")
                        viewModel.changeIsShowingModalView()
                    }
                    .sheet(isPresented: $viewModel.isShowingModalView) {
                        detailView
                    }
                }
            }
            .padding()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
