//
//  File.swift
//  NPExplorer_IR
//
//  Created by niloy.chakraborty on 22/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
public class NP_GRAPIClient: NPAPIClientProtocol {
    
    var environment: NetworkEnvironment
    private var service: NetworkService  = NetworkService()
    init(withEnvironment env: NetworkEnvironment? = nil) {
        
        let defaultConfig = DefaultNetworkEnvironment()
        environment = env ?? NetworkEnvironment(defaultLang: defaultConfig.defaultLanguage,
                                                apiKey: defaultConfig.apikey)
    }
    
    func getService() -> NetworkService {
        return service
    }
}
