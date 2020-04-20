//
//  SeriesCollectionViewCell.swift
//  Channels
//
//  Created by sara.galal on 4/11/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import UIKit

class SeriesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var seriesImage: UIImageView!
    func configure(with item: LatestMedia?) {
        titleLabel.text = item?.title
        if let path = item?.coverAsset?.url {
            seriesImage.sd_setImage(with: URL(string: path),
                                    placeholderImage: Asset.Images.placeholder.image)
        }
       }
       
    override func awakeFromNib() {
        super.awakeFromNib()
        seriesImage.layer.cornerRadius = 20
        seriesImage.layer.masksToBounds = true
    }

}
