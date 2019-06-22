//
//  BaseNetworkClient.swift
//  NPExplorer_IR
//
//  Created by niloy.chakraborty on 22/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
protocol NPAPIClientProtocol{
    var environment: NetworkEnvironment { get }
}

protocol BaseNetworkClientProtocol{
    var client: NPAPIClientProtocol { get }
}

