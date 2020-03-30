//
//  Coordinator.swift
//  Channels
//
//  Created by sara.galal on 3/24/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation
import UIKit
protocol Coordinator: class {

    var childCoordinators: [Coordinator] { get set }

    // All coordinators will be initilised with a navigation controller
    init(navigationController: UINavigationController)

    func start()
}

protocol CoordinatorDelegate: class {
   func navigateToNextPage()
   func navigateToPreviousPage()
}
extension CoordinatorDelegate {
    func navigateToNextPage() {
        
    }
    func navigateToPreviousPage() {
        
    }
}
