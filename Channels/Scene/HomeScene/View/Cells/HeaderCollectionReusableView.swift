//
//  HeaderCollectionReusableView.swift
//  Channels
//
//  Created by sara.galal on 4/11/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
   
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var headerImage: UIImageView!
    @IBOutlet private weak var seperatorView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        headerImage.layer.cornerRadius = headerImage.layer.frame.height / 2
        headerImage.layer.masksToBounds = true
        seperatorView.translatesAutoresizingMaskIntoConstraints = false
        seperatorView.backgroundColor = Asset.Colors.seperatorColor.color
     
    }
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    func configure(image: String?, title: String?, subtitle: Int?, type: SectionType) {
        titleLabel.text = title ?? ""
        if let count = subtitle {
        if type == .series {
            subtitleLabel.text = "\(count)  " + L10n.Series.title
        } else {
            subtitleLabel.text = "\(count)  " + L10n.Episode.title
        }
        }
        if let path = image {
    headerImage.sd_setImage(with: URL(string: path),
                            placeholderImage: Asset.Assets.placeholder.image)
        }
    }
}
