//
//  LoginResource.swift
//  NPExplorer_IR
//
//  Created by niloy.chakraborty on 22/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
public class UserAuthenticationResource_GR {
    static let baseURL = URL(string: "https://api.npexp.com")! //ToDo schema based base url
    
    static func authenticateUser(url baseURL: URL = baseURL, environment: NetworkEnvironment, body: UserAuthenticationFormModel) -> NetworkResource<UserAuthenticationSuccessModel>? {
        
        // Setup path
        guard var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true) else {
            return nil
        }
        
        components.path +=  "/v1/GR/authenticateUser"
        
        //
//        components.path +=  "/v1/IR/countryDetails"
//
//        components.queryItems = Array()
//        components.queryItems?.append(URLQueryItem(name: "api_key", value: ["test1","test2"].joined(separator:",")))
//        components.queryItems?.append(URLQueryItem(name: "country_code", value: environment.defaultLanguage))
//        components.queryItems?.append(URLQueryItem(name: "filter", value: "filter"))
        //print(url.absoluteString)
        //
        
        guard let url = components.url else {
            return nil
        }
        
        // Setup HTTP body
        guard let httpBody = try? JSONEncoder().encode(body) else {
            return nil
        }
        
        print(body)
        
        return NetworkResource(url: url, httpMethod: "POST", headers: nil, body: httpBody)
    }
}
