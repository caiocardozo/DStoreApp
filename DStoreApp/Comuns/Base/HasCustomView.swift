//
//  HasCustomView.swift
//  DStoreApp
//
//  Created by Caio Cardozo on 13/06/23.
//

import UIKit

public protocol HasCustomView {
    associatedtype CustomView: UIView
}

extension HasCustomView where Self: UIViewController {
    public var customView: CustomView {
        guard let customView = view as? CustomView else {
            fatalError("Expected view to be of type \(CustomView.self) but got \(type(of: view)) instead")
        }
        return customView
   }
}
