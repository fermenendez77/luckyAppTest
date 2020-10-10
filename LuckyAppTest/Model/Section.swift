//
//  Section.swift
//  LuckyAppTest
//
//  Created by Fernando Menendez on 10/10/2020.
//

import Foundation

// MARK: - Section
struct Section: Codable {
    let title: String
    let items: [Offer]
}
