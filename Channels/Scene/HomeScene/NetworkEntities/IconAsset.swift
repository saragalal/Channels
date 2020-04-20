//
//  IconAsset.swift
//  Channels
//
//  Created by sara.galal on 4/11/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation
struct IconAsset: Codable, Hashable {
    let thumbnailUrl: String?

    enum CodingKeys: String, CodingKey {

        case thumbnailUrl
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        thumbnailUrl = try values.decodeIfPresent(String.self, forKey: .thumbnailUrl)
    }

}
