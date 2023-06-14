//
//  Cash.swift
//  DStoreApp
//
//  Created by Caio Cardozo on 14/06/23.
//

import Foundation

struct Cash: Codable {
    var title: String?
    var bannerURL: String?
    var info: String?
    
    enum CodingKeys: String, CodingKey {
            case title
            case bannerURL
            case info = "description"
    }
}
