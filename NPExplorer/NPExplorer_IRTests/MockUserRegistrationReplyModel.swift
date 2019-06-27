//
//  MockDataModels_Registration.swift
//  NPExplorer_IRTests
//
//  Created by niloy.chakraborty on 26/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//
import Foundation
import XCTest
@testable import NPExplorer_IR

class MockUserRegistrationReplyModel: UserRegistrationReplyModelProtocol {
    var registrationStatus: String
    
    init(registrationStatus: String) {
        self.registrationStatus = registrationStatus
    }
}


