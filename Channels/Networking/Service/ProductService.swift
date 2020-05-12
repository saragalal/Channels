//
//  ProductService.swift
//  Sample MVP
//
//  Created by Bassem Abbas on 9/18/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation
import Moya

enum  ChannelService {
    case episodes
    case channels
    case categories
}
//swiftlint:disable all

extension ChannelService: TargetType {
    var baseURL: URL {
        return URL(string: NetworkManager.shared.networkConfig.baseUrl)!
    }
    var path: String {
        switch self {
        case .episodes:
            return "/z5AExTtw"
        case .channels:
            return "/Xt12uVhM"
        case .categories:
            return "/A0CgArX3"
        }
        
    }
    
    var method: Moya.Method {
        switch self {
        case .episodes, .channels, .categories:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .episodes, .channels, .categories:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .episodes, .channels, .categories:
			return .requestParameters(
                parameters: [:],
				encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}
