//
//  OffersResponse.swift
//  LuckyAppTest
//
//  Created by Fernando Menendez on 10/10/2020.
//

import Foundation

// MARK: - OffersResponse
struct OffersResponse: Codable {
    let title: String
    let sections: [Section]
}
