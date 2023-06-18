//
//  NSAttributedString+Extension.swift
//  DStoreApp
//
//  Created by Caio Cardozo on 18/06/23.
//

import UIKit

extension NSAttributedString {
    static func combine(_ strings: NSAttributedString...) -> NSMutableAttributedString {
        let mutable = NSMutableAttributedString()
        for string in strings {
            mutable.append(string)
        }
        return mutable
    }
}
