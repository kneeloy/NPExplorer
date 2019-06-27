//
//  UserRegistrationResource.swift
//  NPExplorer_GR
//
//  Created by niloy.chakraborty on 22/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation

public class UserRegistrationResource_IR {
    //static let baseURL = URL(string: "https://api.npexp.com")! //ToDo schema based base url
    static let baseURL = URL(string: "https://npexpapi.azurewebsites.net")!
    
    static func registerUser(url baseURL: URL = baseURL, environment: NetworkEnvironment, body: UserRegistrationFormModel_IR) -> NetworkResource<UserRegistrationReplyModel>? {
        
        // Setup path
        guard var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true) else {
            return nil
        }
        components.path +=  "/api/userregistration/IR"
        guard let url = components.url else {
            return nil
        }
        
        // Setup HTTP body
        guard let httpBody = try? JSONEncoder().encode(body) else {
            return nil
        }

        return NetworkResource(url: url, httpMethod: "POST", headers: nil, body: httpBody)
    }
}
