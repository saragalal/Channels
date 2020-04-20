//
//  TitleHeaderCollectionReusableView.swift
//  Channels
//
//  Created by sara.galal on 4/11/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import UIKit

class TitleHeaderCollectionReusableView: UICollectionReusableView {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var seperatorView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    func configure(type: SectionType) {
        if type == .categories {
            titleLabel.text = L10n.Category.header
            seperatorView.translatesAutoresizingMaskIntoConstraints = false
            seperatorView.backgroundColor = Asset.Colors.seperatorColor.color
        } else {
            seperatorView.backgroundColor = .clear
           titleLabel.text = L10n.Episode.header
        }
    }
}
