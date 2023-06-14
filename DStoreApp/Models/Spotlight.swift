//
//  Spotlight.swift
//  DStoreApp
//
//  Created by Caio Cardozo on 14/06/23.
//

import Foundation

struct Spotlight: Codable {
    
    let name: String?
    let bannerURL: String?
    let info: String?
    
    enum CodingKeys: String, CodingKey {
            case name
            case bannerURL
            case info = "description"
    }
}
