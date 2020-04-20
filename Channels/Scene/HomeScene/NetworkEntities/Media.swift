//
//  Media.swift
//  Channels
//
//  Created by sara.galal on 4/11/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation
struct Media: Codable, Hashable {
    let type: String?
    let title: String?
    let coverAsset: CoverAsset?
    let channel: Channel?
    //let uuid = UUID()
    enum CodingKeys: String, CodingKey {

        case type
        case title
        case coverAsset
        case channel
    }
    init() {
        type = ""
        title = ""
        coverAsset = nil
        channel = nil
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        coverAsset = try values.decodeIfPresent(CoverAsset.self, forKey: .coverAsset)
        channel = try values.decodeIfPresent(Channel.self, forKey: .channel)
    }
//   static func ==(lhs: Media, rhs: Media) -> Bool {
//       return lhs.uuid == rhs.uuid
//   }
//
//   func hash(into hasher: inout Hasher) {
//       hasher.combine(uuid)
//   }
}
struct Channel: Codable, Hashable {
    let title: String?

    enum CodingKeys: String, CodingKey {

        case title
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
    }

}
