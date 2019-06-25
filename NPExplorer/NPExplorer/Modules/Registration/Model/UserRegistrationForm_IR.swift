//
//  UserRegistrationForm_IR.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 24/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation

struct UserRegistrationFormModel_IR: Codable {
    var userName: String
    var password: String
    
    enum CodingKeys: String, CodingKey {
        case userName = "userName"
        case password = "password"
    }
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userName = try container.decode(String.self, forKey: .userName)
        self.password = try container.decode(String.self, forKey: .password)
    }
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.userName, forKey: .userName)
        try container.encode(self.password, forKey: .password)
    }
    
    public init(userName: String, password: String) {
        
        self.userName = userName
        self.password = password
    }
}

//For unit test
protocol UserRegistrationFormModelProtocol_IR {
    var userName: String { get set }
    var password: String { get set }
}

extension UserRegistrationFormModel_IR: UserRegistrationFormModelProtocol_IR {}
