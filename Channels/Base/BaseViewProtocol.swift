//
//  BaseViewProtocol.swift
//  Monshaat_Contributers_IOS
//
//  Created by sara.galal on 11/24/19.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation
import UIKit
@objc
protocol BaseViewProtocol: ViewLoadable, ViewMessageable {
    
}

@objc
protocol ViewLoadable {
    
    // MARK: - Load Indicator
    @objc
    optional func showLoading(allowNavigation: Bool)
    @objc
    optional func hideLoading()
}

@objc
protocol ViewMessageable {
    
    // MARK: - Load Indicator
    @objc
    optional func showSuccessMessage(title: String?, message: String?)
    @objc
    optional func showErrorMessage(title: String?, message: String?)
}
