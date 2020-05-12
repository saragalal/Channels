//
//  NetworkService.swift
//  Sample MVP
//
//  Created by Bassem Abbas on 9/18/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation
import Moya

extension NetworkManager {
    func getDataFromApi(target: TargetType, completion: @escaping (
    _ result: Swift.Result<Data, NetworkError>,
    _ statusCode: StatusCode?
    ) -> Void) {
    provider.request(MultiTarget(target)) { (result) in
        switch result {
        case .success(let response):
            if (200...299 ~= response.statusCode) {
                completion(.success(response.data), response.statusCode)
            } else {
                // 300-399 ,400-499
                do {
                    var businessError = try JSONDecoder().decode(NetworkError.self, from: response.data)
                    print(response.data)
                    businessError.type = .business
                    completion(.failure(businessError), response.statusCode)
                } catch {
                    completion(.failure(NetworkError.parseError), response.statusCode)
                }
            }
            
        case .failure(let error):
            let customError = NetworkError(error: error)
            completion(.failure(customError), nil)
        }
    }
    
    }
}
