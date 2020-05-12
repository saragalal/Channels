//
//  HomeModel.swift
//  Channels
//
//  Created by sara.galal on 3/24/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation
class HomeModel: BaseModel, HomeModelProtocol {
    let homeParser = HomeParser()
    
    func getChannels(completion: @escaping (Result<[Channels]?, NetworkError>) -> Void) {
        NetworkManager.shared.getDataFromApi(target: ChannelService.channels) { result, _ in
           switch result {
           case .success(let data):
          let channels = self.homeParser.parseChannels(data: data)
                completion(.success(channels))
           case .failure(let error):
               print(error)
               completion(.failure(error))
           }
        }
    }
    func getEpisodes(completion: @escaping(Result<[Media]?, NetworkError>) -> Void) {
        NetworkManager.shared.getDataFromApi(target: ChannelService.episodes) { result, _ in
                switch result {
                case .success(let data):

                    let media = self.homeParser.parseEpisode(data: data)
                     completion(.success(media))
                       
                case .failure(let error):
                    print(error)
                    completion(.failure(error))
                }
        }
    }
    func getCategories(completion: @escaping(Result<[Categories]?, NetworkError>) -> Void) {
        NetworkManager.shared.getDataFromApi(target: ChannelService.categories) { result, _ in
                switch result {
                case .success(let data):
                    let categories = self.homeParser.parseCategories(data: data)
                     completion(.success(categories))
                case .failure(let error):
                    print(error)
                    completion(.failure(error))
                }
        }
    }
}
