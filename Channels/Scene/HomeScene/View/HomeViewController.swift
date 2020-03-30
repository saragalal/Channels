//
//  HomeViewController.swift
//  Channels
//
//  Created by sara.galal on 3/24/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController<HomePresenter>, HomeViewProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
    }
}
