//
//  ButtonStyle.swift
//  Swiftui-Moya
//
//  Created by NanbanTaro on 2023/04/24.
//  
//

import Foundation
import SwiftUI

struct CustomButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 100, height: 100)
            .foregroundColor(.white)
            .padding(15)
            .background(configuration.isPressed ? Color.blue.opacity(0.8) : Color.blue)
            .cornerRadius(8)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
        // 非活性状態を制御することはできない。
    }
}
