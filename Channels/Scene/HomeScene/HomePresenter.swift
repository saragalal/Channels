//
//  HomePresenter.swift
//  Channels
//
//  Created by sara.galal on 3/24/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation

class HomePresenter: BasePresenter, HomePresenterProtocol {
    var view: HomeViewProtocol
    var model: HomeModelProtocol
    weak var delegate: CoordinatorDelegate?
    init(view: HomeViewProtocol, model: HomeModelProtocol) {
        self.view = view
        self.model = model
    }
    func viewDidLoad() {
        self.getEpisodes {
            self.getChannels {
                self.getCategories()
            }
        }
    }
    
    func getChannels(completion: @escaping (() -> Void)) {
        model.getChannels { (result) in
            switch result {
            case .success(let data):
                
                self.view.addChannels(channels: data)
                completion()
            case .failure(let error):
                self.view.showErrorMessage?(title: "", message: error.message)
            }
        }
    }
    func getEpisodes(completion: @escaping (() -> Void)) {
        model.getEpisodes { (result) in
                   switch result {
                   case .success(let data):
                    
                       self.view.addEpisodes(episodes: data)
                    completion()
                   case .failure(let error):
                       self.view.showErrorMessage?(title: "", message: error.message)
            }
        }
    }
    func getCategories() {
        model.getCategories { (result) in
                   switch result {
                   case .success(let data):
                       self.view.addCategories(category: data)
                   case .failure(let error):
                       self.view.showErrorMessage?(title: "", message: error.message)
                   }
        }
    }
}
