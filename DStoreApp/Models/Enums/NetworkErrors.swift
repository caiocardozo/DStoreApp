//
//  NetworkErrors.swift
//  DStoreApp
//
//  Created by Caio Cardozo on 14/06/23.
//

import Foundation

enum NetworkErrors: Error {
    case genericError
    case invalidUrl
    case noConnection
    case serverMessage(_ message: String)
    case customServerMessage(_ error: String)
}

extension NetworkErrors: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .genericError:
            return "Ocorreu um erro, tente novamente mais tarde."
        case .invalidUrl:
            return  NSLocalizedString("Url Inválida", comment: "")
        case .noConnection:
            return "Internet está offline"
        case .serverMessage(let message):
            return message
        case .customServerMessage(let error):
            return error
        }
    }
}
