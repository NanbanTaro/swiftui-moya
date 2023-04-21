//
//  AdviceAPI.swift
//  Swiftui-Moya
//
//  Created by NanbanTaro on 2023/04/21.
//  
//

import Foundation
import Moya

enum AdviceAPI {
    case advice
}

extension AdviceAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.adviceslip.com")!
    }

    var path: String {
        return "/advice"
    }

    var method: Moya.Method {
        return .get
    }

    var task: Moya.Task {
        return .requestPlain
    }

    var headers: [String : String]? {
        return nil
    }
}
