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
    @State private var adviceText = "Need some advice?"

    var body: some View {
        NavigationView {
            VStack {
                Text(self.adviceText)
                HStack(alignment: .center) {
                    let detailView = DetailView(text: self.$adviceText)
                    NavigationLink(destination: detailView) {
                        Text("push")
                    }
                    .padding(30)
                    Button("modal") {
                        self.viewModel.changeIsShowingModalView()
                    }
                    .sheet(isPresented: self.$viewModel.isShowingModalView) {
                        detailView
                    }
                    .padding(30)
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
