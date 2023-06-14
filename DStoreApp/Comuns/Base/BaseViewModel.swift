//
//  BaseViewModel.swift
//  DStoreApp
//
//  Created by Caio Cardozo on 13/06/23.
//

import Foundation

class BaseViewModel {
    var error: ((String) -> Void)?
    var isLoading: ((Bool) -> Void)?
}
