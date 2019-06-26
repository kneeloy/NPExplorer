//
//  UserAuthenticationForm.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 24/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
struct UserAuthenticationFormModel: Codable {
    var userName: String?
    var password: String?
    
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
    
    public init(userName: String?, password: String?) {
        
        self.userName = userName
        self.password = password
    }
}
