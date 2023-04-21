//
//  AdviceModel.swift
//  Swiftui-Moya
//
//  Created by NanbanTaro on 2023/04/21.
//  
//

struct AdviceModel: Decodable {
    let slip: Slip
}

struct Slip: Decodable {
    let id: Int
    let advice: String
}
