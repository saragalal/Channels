//
//  UIcollectionViewCell+extension.swift
//  Channels
//
//  Created by sara.galal on 4/11/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation
import UIKit
extension UICollectionViewCell {
static var nib: UINib {
    return UINib(nibName: identifier, bundle: nil)
}

static var identifier: String {
    return String(describing: self)
}
}
