//
//  SplashCoordinator.swift
//  Channels
//
//  Created by sara.galal on 3/30/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation
import UIKit
class SplashCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    unowned var navigationController: UINavigationController
    private var homeCoordinator: HomeCoordinator?
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    private func createModule() -> UIViewController {
        let view = SpalshViewController()
        return view
    }
    
    func start() {
        let splashView = self.createModule()
        navigationController.pushViewController(splashView, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.navigateToNextPage()
        }
    }
    func startHome() {
        let coordinator = HomeCoordinator(navigationController: navigationController)
        self.homeCoordinator = coordinator
        if let homeCoordinator = self.homeCoordinator {
        childCoordinators.append(homeCoordinator)
        }
        self.homeCoordinator?.start()
    }
}

extension SplashCoordinator: CoordinatorDelegate {
    func navigateToNextPage() {
        self.startHome()
    }
}
