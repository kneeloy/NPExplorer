//
//  NetworkResource.swift
//  NPExplorer_IR
//
//  Created by niloy.chakraborty on 22/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}

public struct NetworkResource<NetworkSuccessType: Decodable> {
    
    public let url: URL
    public let httpMethod: String
    public let headers: [String: String]?
    public let body: Data?
    
    /// Fulfilled URLRequest object
    public var urlRequest: URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        headers?.forEach {
            request.setValue($1, forHTTPHeaderField: $0)
        }
        request.httpBody = body
        return request
    }
    
    /// Constructor
    public init(url: URL, httpMethod: String, headers: [String: String]?, body: Data?) {
        self.url = url
        self.httpMethod = httpMethod
        self.headers = headers
        self.body = body
    }
}
