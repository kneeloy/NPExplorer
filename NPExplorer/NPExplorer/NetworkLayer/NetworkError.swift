//
//  NetworkError.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 22/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation


public enum NetworkServiceError: Error, CustomStringConvertible {
    case failedObjectSerialization(response: HTTPURLResponse?, error: Error)
    case failedParameterSerialization(error: Error)
    case httpResponseError(error: Error)
    case invalidResponseData(error: Error)
    case cancelled
    case invalidResponse(response: HTTPURLResponse?, data: NSData?) //If i put Data instead of NSData swift compiler crash with segmentation fault
    
    public var description: String {
        switch self {
        case .failedObjectSerialization(let error): return "The response Json does not represent the expected object type: \(error)"
        case .failedParameterSerialization(let error): return "The parameters cannot be serialized in JSON and used as HTTP body for the following reason: \(error)"
        case .httpResponseError(let error): return "The request result is an error: \(error)"
        case .invalidResponseData(let error): return "The response is not a valid JSON object: \(error)"
        case .cancelled: return "Networking operation manually cancelled"
        case .invalidResponse(let response): return "Invalid response or response code: \(String(describing: response))"
        }
    }
}
