//
//  BaseIRNetworkClient.swift
//  NPExplorer_IR
//
//  Created by niloy.chakraborty on 22/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
class BaseIRNetworkClient: BaseNetworkClientProtocol_IR {
    
    let client: NP_IRAPIClient
    
    init(environment: NetworkEnvironment? = nil) {
        
        client = NP_IRAPIClient(withEnvironment: environment)
    }
}
