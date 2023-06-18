//
//  Dictionary+Extensions.swift
//  DStoreApp
//
//  Created by Caio Cardozo on 18/06/23.
//

import UIKit

extension Dictionary where Key == NSAttributedString.Key {
    static var primaryBlueBoldAttributes: [NSAttributedString.Key: Any] {
        [
            .font:UIFont.boldSystemFont(ofSize: 18.0),
            .foregroundColor: UIColor.appColor(.primaryColorBlue) ?? .blue
        ]
    }
    static var primaryGrayBoldAttributes: [NSAttributedString.Key: Any] {
        [
            .font:UIFont.boldSystemFont(ofSize: 18.0),
            .foregroundColor: UIColor.gray
        ]
    }
}
