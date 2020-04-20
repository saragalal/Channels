//
//  HomeProtocols.swift
//  Channels
//
//  Created by sara.galal on 3/24/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation

protocol HomeViewProtocol: BaseViewProtocol {
    func addChannels(channels: [Channels]?)
    func addEpisodes(episodes: [Media]?)
    func addCategories(category: [Categories]?)
}
protocol HomeModelProtocol: BaseModelProtocol {
    func getChannels(completion: @escaping (Result<[Channels]?, NetworkError>) -> Void)
    func getEpisodes(completion: @escaping(Result<[Media]?, NetworkError>) -> Void)
    func getCategories(completion: @escaping(Result<[Categories]?, NetworkError>) -> Void)
}
protocol HomePresenterProtocol: BasePresenterProtocol {
    func getChannels(completion: @escaping (() -> Void))
    func getEpisodes(completion: @escaping (() -> Void))
    func getCategories()
}
