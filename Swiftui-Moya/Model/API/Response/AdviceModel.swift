//
//  AdviceModel.swift
//  Swiftui-Moya
//
//  Created by NanbanTaro on 2023/04/21.
//  
//

struct AdviceModel: Decodable {
    var slip: Slip = Slip()
}

struct Slip: Decodable {
    var id: Int = 0
    var advice: String = "Need some advice?"
}
