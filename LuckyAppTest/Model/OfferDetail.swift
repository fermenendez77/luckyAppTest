//
//  OfferDetail.swift
//  LuckyAppTest
//
//  Created by Fernando Menendez on 11/10/2020.
//

import Foundation

// MARK: - OfferDetail
struct OfferDetail: Codable {
    let id: Int
    let imageURL: String
    let brand, title, tags: String
    let favoriteCount: Int
    let offerDetailDescription: String
    let price: Price
    let expiration, redemptionsCap: String

    enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "imageUrl"
        case brand, title, tags, favoriteCount
        case offerDetailDescription = "description"
        case price, expiration, redemptionsCap
    }
}

// MARK: - Price
struct Price: Codable {
    let old, new: String
}
