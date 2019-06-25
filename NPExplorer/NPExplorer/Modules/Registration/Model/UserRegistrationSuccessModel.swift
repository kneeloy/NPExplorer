//
//  UserRegistrationSuccessModel.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 24/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
struct UserRegistrationSuccessModel: Codable {
    var userId: Int
    
    enum CodingKeys: String, CodingKey {
        case userId = "userId"
    }
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userId = try container.decode(Int.self, forKey: .userId)
    }
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.userId, forKey: .userId)
    }
    
    public init(userId: Int) {
        
        self.userId = userId
    }
}

//For unit test
protocol UserRegistrationSuccessModelProtocol {
    var userId: Int { get set }
}

extension UserRegistrationSuccessModel: UserRegistrationSuccessModelProtocol {}
