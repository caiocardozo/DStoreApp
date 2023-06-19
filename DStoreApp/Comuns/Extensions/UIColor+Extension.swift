//
//  UIColor+Extension.swift
//  DStoreApp
//
//  Created by Caio Cardozo on 18/06/23.
//

import UIKit

extension UIColor {
    enum Colors: String {
        case primaryColorBlue
    }
}

extension UIColor {
    static func appColor(_ name: Colors) -> UIColor? {
        return UIColor.init(named: name.rawValue)
    }
}
