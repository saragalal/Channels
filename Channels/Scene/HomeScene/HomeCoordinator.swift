//
//  HomeCoordinator.swift
//  Channels
//
//  Created by sara.galal on 3/24/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation
import UIKit
class HomeCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    unowned var navigationController: UINavigationController
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    private func createModule() -> UIViewController {
        let view = HomeViewController()
        let model = HomeModel()
        let presenter = HomePresenter(view: view, model: model)
        presenter.delegate = self
        view.setPresenter(presenter: presenter)
        return view
    }
    
    func start() {
        let homeView = self.createModule()
        navigationController.pushViewController(homeView, animated: true)
        navigationController.viewControllers = [homeView]
    }    
}

extension HomeCoordinator: CoordinatorDelegate {
    func navigateToNextPage() {
        
    }
}
