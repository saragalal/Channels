//
//  BaseViewController.swift
//  Monshaat_Contributers_IOS
//
//  Created by sara.galal on 11/24/19.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation
import UIKit
class BaseViewController<Presenter: BasePresenterProtocol>: UIViewController, BaseViewProtocol {

    var presenter: Presenter!
    
    public func setPresenter (presenter: Presenter) {
        self.presenter = presenter
    }
    
    func showLoading(allowNavigation: Bool) {
        
    }
  
    func hideLoading() {
       
    }
    
    func showErrorMessage(title: String?, message: String?) {
     
    }
}
