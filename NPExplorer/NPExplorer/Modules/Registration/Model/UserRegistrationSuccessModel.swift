//
//  UserRegistrationSuccessModel.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 24/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
struct UserRegistrationReplyModel: Codable {
    var registrationStatus: String
    
    enum CodingKeys: String, CodingKey {
        case registrationStatus = "registrationStatus"
    }
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.registrationStatus = try container.decode(String.self, forKey: .registrationStatus)
    }
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.registrationStatus, forKey: .registrationStatus)
    }
    
    public init(registrationStatus: String) {
        
        self.registrationStatus = registrationStatus
    }
}

//For unit test
protocol UserRegistrationReplyModelProtocol {
    var registrationStatus: String { get set }
}

extension UserRegistrationReplyModel: UserRegistrationReplyModelProtocol {}
