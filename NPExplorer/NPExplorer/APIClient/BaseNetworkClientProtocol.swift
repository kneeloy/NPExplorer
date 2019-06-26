//
//  BaseNetworkClient.swift
//  NPExplorer_IR
//
//  Created by niloy.chakraborty on 22/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation

protocol BaseNetworkClientProtocol_IR{
    var client: NP_IRAPIClient { get }
}

protocol BaseNetworkClientProtocol_GR{
    var client: NP_GRAPIClient { get }
}

