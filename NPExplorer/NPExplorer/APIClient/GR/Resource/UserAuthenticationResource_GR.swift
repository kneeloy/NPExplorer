//
//  LoginResource.swift
//  NPExplorer_IR
//
//  Created by niloy.chakraborty on 22/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
public class UserAuthenticationResource_GR {
    static let baseURL = URL(string: "https://npexpapi.azurewebsites.net")! //ToDo schema based base url
    
    static func authenticateUser(url baseURL: URL = baseURL, environment: NetworkEnvironment, body: UserAuthenticationFormModel) -> NetworkResource<UserAuthenticationReplyModel>? {
        
        // Setup path
        guard var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true) else {
            return nil
        }
        
//        components.path +=  "/api/userauthentication/GR"
//
//        guard let url = components.url else {
//            return nil
//        }
//
//        // Setup HTTP body
//        guard let httpBody = try? JSONEncoder().encode(body) else {
//            return nil
//        }
//
//        print(body)
        
        components.path +=  "/api/userauthentication/GR"
        
        //ToDo pass authorization token in header
        
        guard let url = components.url else {
            return nil
        }
        
        return NetworkResource(url: url, httpMethod: "GET", headers: nil, body: nil)
        
        //return NetworkResource(url: url, httpMethod: "POST", headers: nil, body: httpBody)
    }
}
