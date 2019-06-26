//
//  NetworkService.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 22/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
import UIKit

public protocol URLSessionRepresenting {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionRepresenting { }

public class NetworkService {
    
    private let session: URLSessionRepresenting
    private var task: URLSessionDataTask?
    public var url: URL? //For ImageFetcherJob
    
    public init(withURL url: URL? = nil, _ session: URLSessionRepresenting = URLSession.shared) {
        
        self.session = session
        self.url = url
    }
    
    public func decodeResonse<T: Decodable>(fromData data: Data, forResource: NetworkResource<T>) throws -> T? {
        let jsonDecoder = JSONDecoder()
        return try jsonDecoder.decode(T.self, from: data)
    }
    
    public func execute<T: Decodable>(withResource: NetworkResource<T>,
                                      successHandler: ((T, URLResponse)->Void)?,
                                      errorHandler: ((_ response: URLResponse?, _ error: NetworkServiceError)->Void)?) {
        
        let request = withResource.urlRequest
        print(request)
        task = session.dataTask(with: request) {[weak self] (data, response, error) in
            guard let self = self else { return }
            let response = response as? HTTPURLResponse
            
            print(response)
            
            if let responseError = error {
                
                errorHandler?(response, NetworkServiceError.httpResponseError(error: responseError))
            } else if let responseData = data {
                
                print(response)
                guard let code = response?.statusCode, code >= 200 && code < 300 else {
                    
                    errorHandler?(response, NetworkServiceError.invalidResponse(response: response, data: NSData(data: responseData)))
                    return
                }
                
                do {
                    let object = try self.decodeResonse(fromData: responseData, forResource: withResource)
                    if let responseObject = object, let resopnseVal = response {
                        //We got everything pass the info to client
                        successHandler?(responseObject, resopnseVal)
                    }
                } catch let jsonError {
                    
                    errorHandler?(response, NetworkServiceError.failedObjectSerialization(response: response, error: jsonError))
                }
            } else {
                errorHandler?(response, NetworkServiceError.invalidResponseData(error: "The response data is empty" as! Error))
                
            }
        }
        task!.resume()
    }
}
