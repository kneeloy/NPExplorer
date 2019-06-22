//
//  CountryDetailsResource.swift
//  NPExplorer_GR
//
//  Created by niloy.chakraborty on 22/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
public class CountryDetailsResource_GR {
    static let baseURL = URL(string: "https://api.npexp.com")!
    
    static func getCountryDetails(url baseURL: URL = baseURL, environment: NetworkEnvironment, forFilterParm filter: String) -> NetworkResource<CountryDetailBaseModel>? {
        
        // Setup path
        guard var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true) else {
            return nil
        }
        components.path +=  "/v1/IR/countryDetails"
        
        components.queryItems = Array()
        components.queryItems?.append(URLQueryItem(name: "api_key", value: environment.apikey))
        components.queryItems?.append(URLQueryItem(name: "country_code", value: environment.defaultLanguage))
        components.queryItems?.append(URLQueryItem(name: "filter", value: filter))
        
        guard let url = components.url else {
            return nil
        }
        
        return NetworkResource(url: url, httpMethod: "GET", headers: nil, body: nil)
    }
}
