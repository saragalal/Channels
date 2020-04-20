//
//  HomeModel.swift
//  Channels
//
//  Created by sara.galal on 3/24/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation
class HomeModel: BaseModel, HomeModelProtocol {
    let channelsResponse = Bundle.main.decode(APIResponse<HomeObject>.self, from: "ChannelsResponse.json")
    let categoriesResponse = Bundle.main.decode(APIResponse<HomeObject>.self, from: "CategoryResponse.json")
    let episodesResponse = Bundle.main.decode(APIResponse<HomeObject>.self, from: "EpisodeResponse.json")
    
    func getChannels(completion: @escaping (Result<[Channels]?, NetworkError>) -> Void) {
        completion(.success(channelsResponse.data?.channels))
    }
    func getEpisodes(completion: @escaping(Result<[Media]?, NetworkError>) -> Void) {
        completion(.success(episodesResponse.data?.media))
    }
    func getCategories(completion: @escaping(Result<[Categories]?, NetworkError>) -> Void) {
        completion(.success(categoriesResponse.data?.categories))
    }
}
