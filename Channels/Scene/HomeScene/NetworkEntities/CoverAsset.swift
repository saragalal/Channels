//
//  CoverAsset.swift
//  Channels
//
//  Created by sara.galal on 4/11/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation
struct CoverAsset: Codable, Hashable {
    let url: String?

    enum CodingKeys: String, CodingKey {

        case url
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        url = try values.decodeIfPresent(String.self, forKey: .url)
    }

}
