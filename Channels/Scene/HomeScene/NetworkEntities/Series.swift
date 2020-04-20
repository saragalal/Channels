//
//  Series.swift
//  Channels
//
//  Created by sara.galal on 4/11/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation
struct Series: Codable, Hashable {
    let title: String?
    let coverAsset: CoverAsset?

    enum CodingKeys: String, CodingKey {

        case title
        case coverAsset

    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try values.decodeIfPresent(String.self, forKey: .title)
        coverAsset = try values.decodeIfPresent(CoverAsset.self, forKey: .coverAsset)
     
    }
}
