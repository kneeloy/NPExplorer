//
//  CountryDetailAttributesResource_IR.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 25/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
public class CountryDetailsAttributesResource_IR {
    static let baseURL = URL(string: "https://api.npexp.com")!
    
    static func getCountryDetailAttributes(url baseURL: URL = baseURL, environment: NetworkEnvironment) -> NetworkResource<CountryDetailAttributeModelContainer>? {
        
        // Setup path
        guard var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true) else {
            return nil
        }
        components.path +=  "/v1/IR/countryDetailsAttributes"
        
        //ToDo pass authorization token in header
        
        guard let url = components.url else {
            return nil
        }
        
        return NetworkResource(url: url, httpMethod: "GET", headers: nil, body: nil)
    }
}
