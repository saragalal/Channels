//
//  EpisodeCollectionViewCell.swift
//  Channels
//
//  Created by sara.galal on 4/11/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import UIKit

class EpisodeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var episodeImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    func configure(with item: Media?) {
        titleLabel.text = item?.title ?? ""
        subtitleLabel.text = item?.channel?.title ?? ""
        if let path = item?.coverAsset?.url {
            episodeImage.sd_setImage(with: URL(string: path),
                                     placeholderImage: Asset.Images.placeholder.image)
        }
       }
       
    override func awakeFromNib() {
        super.awakeFromNib()
        episodeImage.layer.cornerRadius = 20
        episodeImage.layer.masksToBounds = true
    }

}
