//
//  UserRegistrationResource.swift
//  NPExplorer_GR
//
//  Created by niloy.chakraborty on 22/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
public class UserRegistrationResource_GR {
    static let baseURL = URL(string: "https://api.npexp.com")! //ToDo schema based base url
    
    static func registerUser(url baseURL: URL = baseURL, environment: NetworkEnvironment, body: UserRegistrationFormModel_GR) -> NetworkResource<UserRegistrationSuccessModel>? {
        
        // Setup path
        guard var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true) else {
            return nil
        }
        
        guard let url = components.url else {
            return nil
        }
        components.path +=  "/v1/GR/registerUser"
        // Setup HTTP body
        guard let httpBody = try? JSONEncoder().encode(body) else {
            return nil
        }
        
        
        
        return NetworkResource(url: url, httpMethod: "POST", headers: nil, body: httpBody)
    }
}
