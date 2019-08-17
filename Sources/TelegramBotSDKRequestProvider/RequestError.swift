//
//  RequestError.swift
//  TelegramBotSDKRequestProvider
//
//  Created by Matteo Piccina on 17/08/2019.
//

import Foundation

public enum RequestError: Error {
    /// Invalid request
    case invalidRequest
    
    /// Status Code is not 200 (OK)
    case invalidStatusCode(statusCode: Int, data: Data?)
    
    /// Telegram server returned no data
    case noDataReceived
    
    /// Server error (server returned "ok: false")
    case serverError(data: Data)
    
    /// Wrapper error
    case wrapperError(code: Int, message: String)
}

extension RequestError: CustomDebugStringConvertible {
    // MARK: CustomDebugStringConvertible
    public var debugDescription: String {
        switch self {
        case .invalidRequest:
            return "Invalid HTTP request"
        case let .invalidStatusCode(statusCode, _):
            return "Expected status code 200, got \(statusCode)"
        case .noDataReceived:
            return "No data received"
        case .serverError:
            return "Telegram server returned an error"
        case let .wrapperError(code, message):
            return "Wrapper error \(code): \(message)"
        }
    }
}
