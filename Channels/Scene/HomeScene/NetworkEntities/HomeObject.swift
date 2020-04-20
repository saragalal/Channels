//
//  HomeObject.swift
//  Channels
//
//  Created by sara.galal on 4/12/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation
struct HomeObject: Hashable, Codable {
let channels: [Channels]?
let media: [Media]?
let categories: [Categories]?
let uuid = UUID()
enum CodingKeys: String, CodingKey {

    case channels
    case media
    case categories
 
}

init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    channels = try values.decodeIfPresent([Channels].self, forKey: .channels)
    media = try values.decodeIfPresent([Media].self, forKey: .media)
    categories = try values.decodeIfPresent([Categories].self, forKey: .categories)
 }
    
    static func == (lhs: HomeObject, rhs: HomeObject) -> Bool {
        return lhs.uuid == rhs.uuid
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
}
