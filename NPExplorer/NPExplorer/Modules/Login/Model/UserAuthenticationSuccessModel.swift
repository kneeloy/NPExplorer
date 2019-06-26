//
//  UserAuthenticationSuccessModel.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 24/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
struct UserAuthenticationReplyModel: Codable {
    var authenticationKey: String?
    var userName: String?
    
    enum CodingKeys: String, CodingKey {
        case authenticationKey = "authenticationKey"
        case userName = "userName"
    }
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.authenticationKey = try container.decode(String.self, forKey: .authenticationKey)
        self.userName = try container.decode(String.self, forKey: .userName)
    }
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.authenticationKey, forKey: .authenticationKey)
        try container.encode(self.userName, forKey: .userName)
    }
    
    public init(authenticationKey: String, userName: String) {
        
        self.authenticationKey = authenticationKey
        self.userName = userName
    }
}

//For unit test
protocol UserAuthenticationReplyModelProtocol {
    var authenticationKey: String? { get set }
    var userName: String? { get set }
}

extension UserAuthenticationReplyModel: UserAuthenticationReplyModelProtocol {}

