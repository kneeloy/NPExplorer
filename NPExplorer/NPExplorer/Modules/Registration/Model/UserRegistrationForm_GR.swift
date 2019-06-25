//
//  UserRegistrationForm_GR.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 24/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation

struct UserRegistrationFormModel_GR: Codable {
    var passCode: String
    
    enum CodingKeys: String, CodingKey {
        case passCode = "passCode"
    }
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.passCode = try container.decode(String.self, forKey: .passCode)
    }
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.passCode, forKey: .passCode)
    }
    
    public init(passCode: String) {
        
        self.passCode = passCode
    }
}

//For unit test
protocol UserRegistrationFormModelProtocol_GR {
    var passCode: String { get set }
}

extension UserRegistrationFormModel_GR: UserRegistrationFormModelProtocol_GR {}
