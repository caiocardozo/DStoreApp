//
//  UICollectionViewCell+Extension.swift
//  DStoreApp
//
//  Created by Caio Cardozo on 14/06/23.
//

import UIKit

extension UICollectionViewCell {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
