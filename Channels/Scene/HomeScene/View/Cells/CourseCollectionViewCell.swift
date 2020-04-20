//
//  CourseCollectionViewCell.swift
//  Channels
//
//  Created by sara.galal on 4/11/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import UIKit
import SDWebImage
class CourseCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var courseImage: UIImageView!
    func configure(with item: LatestMedia?) {
        titleLabel.text = item?.title
        if let path = item?.coverAsset?.url {
    courseImage.sd_setImage(with: URL(string: path),
                            placeholderImage: Asset.Images.placeholder.image)
        }
       }
       
    override func awakeFromNib() {
        super.awakeFromNib()
        courseImage.layer.cornerRadius = 20
        courseImage.layer.masksToBounds = true
    }

}
