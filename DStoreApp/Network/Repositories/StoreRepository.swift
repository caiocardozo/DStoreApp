//
//  StoreRepository.swift
//  DStoreApp
//
//  Created by Caio Cardozo on 14/06/23.
//

import Foundation

class StoreRepository {
    static func fetchStors(success: @escaping (Store) -> Void, error: @escaping (String) -> Void) {
       
        let url = APIConstantsService.urlBase
        NetworkManager.shared.request(url) {( response: Result<Store, NetworkErrors>) in
            switch response {
            case .success(let data):
                success(data)
            case .failure(let e):
                error(e.localizedDescription)
            }
        }
    }
}
