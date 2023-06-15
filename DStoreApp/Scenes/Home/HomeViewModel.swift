//
//  HomeViewModel.swift
//  DStoreApp
//
//  Created by Caio Cardozo on 13/06/23.
//

import Foundation

final class HomeViewModel: BaseViewModel {
    
    // MARK: - Variables
    var stores: Store?
    
    // MARK: - Request
    func loadData() {
        isLoading?(true)
        StoreRepository.fetchStors { response in
            self.isLoading?(false)
            self.stores = response
            debugPrint(response)
        } error: { error in
            self.isLoading?(false)
            self.error?(error)
        }
    }
}

