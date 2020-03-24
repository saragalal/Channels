//
//  ApplicationCoordinator.swift
//  Channels
//
//  Created by sara.galal on 3/24/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation
import UIKit
class ApplicationCoordinator: Coordinator {
    private var window: UIWindow?
    var childCoordinators: [Coordinator] = []
    unowned let navigationController: UINavigationController
    private var homeCoordinator: HomeCoordinator?
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if #available(iOS 13, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = (scene as? UIWindowScene) else { return }
            window = UIWindow(windowScene: windowScene)
        } else {
         guard let appwindow = (UIApplication.shared.delegate?.window as? UIWindow) else { return }
         window = appwindow
        }
        window?.rootViewController = navigationController
        self.startHome()
        window?.makeKeyAndVisible()
    }
    func startHome() {
        let coordinator = HomeCoordinator(navigationController: navigationController)
        self.homeCoordinator = coordinator
        self.homeCoordinator?.start()
    }
}
