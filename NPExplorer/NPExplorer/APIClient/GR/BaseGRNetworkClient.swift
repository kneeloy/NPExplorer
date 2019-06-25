//
//  BaseNetworkClient.swift
//  NPExplorer_GR
//
//  Created by niloy.chakraborty on 22/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
class BaseGRNetworkClient: BaseNetworkClientProtocol_GR {
    
    let client: NP_GRAPIClient
    
    init(environment: NetworkEnvironment? = nil) {
        
        client = NP_GRAPIClient(withEnvironment: environment)
    }
}
