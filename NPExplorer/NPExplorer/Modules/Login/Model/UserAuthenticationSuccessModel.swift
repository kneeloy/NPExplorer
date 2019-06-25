//
//  UserAuthenticationSuccessModel.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 24/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
struct UserAuthenticationSuccessModel: Codable {
    var authenticationKey: String
    
    enum CodingKeys: String, CodingKey {
        case authenticationKey = "authenticationKey"
    }
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.authenticationKey = try container.decode(String.self, forKey: .authenticationKey)
    }
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.authenticationKey, forKey: .authenticationKey)
    }
    
    public init(authenticationKey: String) {
        
        self.authenticationKey = authenticationKey
    }
}

//For unit test
protocol UserAuthenticationSuccessModelProtocol {
    var authenticationKey: String { get set }
}

extension UserAuthenticationSuccessModel: UserAuthenticationSuccessModelProtocol {}

