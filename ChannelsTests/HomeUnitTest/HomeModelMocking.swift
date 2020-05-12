//
//  HomeModelMocking.swift
//  ChannelsTests
//
//  Created by sara.galal on 5/12/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation
import XCTest
@testable import Channels

class HomeModelMocking: HomeModelProtocol {
    var channels: [Channels]? = [Channels]()
    var media: [Media]? = [Media]()
    var categories: [Categories]? = [Categories]()
    var type: Type?
    
    func getChannels(completion: @escaping (Result<[Channels]?, NetworkError>) -> Void) {
       let channelsResponse = Bundle.main.decode(APIResponse<HomeObject>.self,
                                                 from: "ChannelsResponse.json")
        self.channels = channelsResponse.data?.channels
        completion(.success(channelsResponse.data?.channels))
          
    }
    
    func getEpisodes(completion: @escaping (Result<[Media]?, NetworkError>) -> Void) {
        let episodesResponse = Bundle.main.decode(APIResponse<HomeObject>.self,
                                                  from: "EpisodeResponse.json")
        self.media = episodesResponse.data?.media
        completion(.success(episodesResponse.data?.media))
    }
    
    func getCategories(completion: @escaping (Result<[Categories]?, NetworkError>) -> Void) {
          let categoriesResponse = Bundle.main.decode(APIResponse<HomeObject>.self,
                                                      from: "CategoryResponse.json")
        self.categories = categoriesResponse.data?.categories
        completion(.success(categoriesResponse.data?.categories))
    }
    func getFirstEpisode() -> String? {
        return media?[0].title
    }
}

enum Type {
    case mock
    case stub
}
