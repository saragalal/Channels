//
//  CategoryCollectionViewCell.swift
//  Channels
//
//  Created by sara.galal on 4/11/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var categoryBackgroundView: UIView!
    @IBOutlet private weak var categoryLabel: UILabel!
    func configure(with item: Categories?) {
        categoryBackgroundView.layer.cornerRadius = categoryBackgroundView.frame.height / 2
        categoryBackgroundView.layer.masksToBounds = true
        categoryLabel.text = item?.name ?? ""
     }
     
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
