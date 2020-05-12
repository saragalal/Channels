//
//  HomeParser.swift
//  Channels
//
//  Created by sara.galal on 5/12/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation
class HomeParser: NSObject {
func parseChannels(data: Data) -> [Channels]? {
    var channels: [Channels]? = [Channels]()
    do {
     let result = try JSONDecoder().decode(APIResponse<HomeObject>.self, from: data)
        channels = result.data?.channels
   } catch {
        
    }
    return channels
}

    func parseEpisode(data: Data) -> [Media]? {
        var media: [Media]? = [Media]()
        do {
         let result = try JSONDecoder().decode(APIResponse<HomeObject>.self, from: data)
            media = result.data?.media
       } catch {
            
        }
        return media
    }
    func parseCategories(data: Data) -> [Categories]? {
        var categories: [Categories]? = [Categories]()
        do {
         let result = try JSONDecoder().decode(APIResponse<HomeObject>.self, from: data)
            categories = result.data?.categories
       } catch {
            
        }
        return categories
    }
}
