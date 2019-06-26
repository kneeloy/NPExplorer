//
//  CountryDetailsResource.swift
//  NPExplorer_GR
//
//  Created by niloy.chakraborty on 22/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
public class CountryDetailsResource_IR {
    static let baseURL = URL(string: "https://api.npexp.com")!
    
    static func getCountryDetails(url baseURL: URL = baseURL, environment: NetworkEnvironment, filterAttributes : [String]) -> NetworkResource<CountryDetailModelContainer>? {
        
        // Setup path
        guard var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true) else {
            return nil
        }
        components.path +=  "/v1/IR/countryDetails"
        
        //ToDo pass authorization token in header
        components.queryItems = Array()
        components.queryItems?.append(URLQueryItem(name: "attributes", value: filterAttributes.joined(separator:",")))
        
        guard let url = components.url else {
            return nil
        }
        
        return NetworkResource(url: url, httpMethod: "GET", headers: nil, body: nil)
    }
}
