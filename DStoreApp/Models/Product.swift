//
//  Products.swift
//  DStoreApp
//
//  Created by Caio Cardozo on 14/06/23.
//

import Foundation

struct Product: Codable {
    var name: String?
    var imageURL: String?
    var info: String?
    
    enum CodingKeys: String, CodingKey {
            case name
            case imageURL
            case info = "description"
    }
}
