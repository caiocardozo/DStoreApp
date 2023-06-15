//
//  Store.swift
//  DStoreApp
//
//  Created by Caio Cardozo on 14/06/23.
//

import Foundation

struct Store: Codable {
    var spotlight: [Spotlight]?
    var products: [Products]?
    var cash: Cash?
}
