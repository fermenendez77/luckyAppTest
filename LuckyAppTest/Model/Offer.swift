//
//  Offer.swift
//  LuckyAppTest
//
//  Created by Fernando Menendez on 10/10/2020.
//

import Foundation

struct Offer: Codable {
    let detailURL, imageURL: String
    let brand, title: String
    let tags: String?
    let favoriteCount: Int

    enum CodingKeys: String, CodingKey {
        case detailURL = "detailUrl"
        case imageURL = "imageUrl"
        case brand, title, tags, favoriteCount
    }
}
