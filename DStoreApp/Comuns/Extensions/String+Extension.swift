//
//  String+Extension.swift
//  DStoreApp
//
//  Created by Caio Cardozo on 18/06/23.
//

import UIKit

extension String {
    func withAttributes(_ attributes: [NSAttributedString.Key: Any]) -> NSAttributedString {
        return NSAttributedString(string: self, attributes: attributes)
    }
}

// MARK: - Text Styles
extension String {
    var primaryTitleBlue: NSAttributedString {
        withAttributes(.primaryBlueBoldAttributes)
    }
    var primaryTitleGray: NSAttributedString {
        withAttributes(.primaryGrayBoldAttributes)
    }
}

// MARK: - Localizable
protocol Localizable {
    var localized: String { get }
}

extension String: Localizable {
    
    static let empty = ""
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}

