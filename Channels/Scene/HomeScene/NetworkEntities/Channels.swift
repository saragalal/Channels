//
//  Channels.swift
//  Channels
//
//  Created by sara.galal on 4/11/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation

struct Channels: Codable, Hashable {
//    let uuid = UUID()
    let title: String?
    let series: [Series]?
    let mediaCount: Int?
    let latestMedia: [LatestMedia]?
    let id: String?
    let iconAsset: IconAsset?
    let coverAsset: CoverAsset?

    enum CodingKeys: String, CodingKey {

        case title
        case series
        case mediaCount
        case latestMedia
        case id
        case iconAsset
        case coverAsset
    }
    
     init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        series = try values.decodeIfPresent([Series].self, forKey: .series)
        mediaCount = try values.decodeIfPresent(Int.self, forKey: .mediaCount)
        latestMedia = try values.decodeIfPresent([LatestMedia].self, forKey: .latestMedia)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        iconAsset = try values.decodeIfPresent(IconAsset.self, forKey: .iconAsset)
        coverAsset = try values.decodeIfPresent(CoverAsset.self, forKey: .coverAsset)
    }
//    static func ==(lhs: Channels, rhs: Channels) -> Bool {
//        return lhs.uuid == rhs.uuid
//    }
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(uuid)
//    }
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(title)
//         hasher.combine(series)
//         hasher.combine(mediaCount)
//         hasher.combine(latestMedia)
//         hasher.combine(id)
//         hasher.combine(iconAsset)
//        hasher.combine(coverAsset)
//    }
}
