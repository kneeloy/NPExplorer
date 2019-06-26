//
//  MockUserRegistrationDataManager_IR.swift
//  NPExplorer_IRTests
//
//  Created by niloy.chakraborty on 26/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
import XCTest
@testable import NPExplorer_IR

//Success Case
class MockUserRegistrationDataManager_IR: UserRegistrationDataManagerProtocol_IR {
    var userRegistrationUpdater: UserRegistrationUpdaterProtocol_IR?
    var mockUserRegistrationReplyModel: UserRegistrationReplyModelProtocol
    
    func registerUser(userRegistrationForm: UserRegistrationFormModel_IR, success: @escaping ((UserRegistrationReplyModelProtocol, URLResponse) -> Void), failure: @escaping ((URLResponse?, NetworkServiceError) -> Void)) {
        let mockUrlResponse = URLResponse(url: URL(string: "Google.com")!, mimeType: nil, expectedContentLength: 1, textEncodingName: nil)
        
        success(mockUserRegistrationReplyModel, mockUrlResponse)
    }
    
    init(withMockUserRegistrationReplyModel: UserRegistrationReplyModelProtocol) {
        self.mockUserRegistrationReplyModel = withMockUserRegistrationReplyModel
    }
    
}

//Error case
class MockUserRegistrationErrorDataManager_IR: UserRegistrationDataManagerProtocol_IR {
    var userRegistrationUpdater: UserRegistrationUpdaterProtocol_IR?
    var mockError: NetworkServiceError
    
    func registerUser(userRegistrationForm: UserRegistrationFormModel_IR, success: @escaping ((UserRegistrationReplyModelProtocol, URLResponse) -> Void), failure: @escaping ((URLResponse?, NetworkServiceError) -> Void)) {
        let mockUrlResponse = URLResponse(url: URL(string: "Google.com")!, mimeType: nil, expectedContentLength: 1, textEncodingName: nil)
        
       failure(nil, mockError)
    }
    
    init(withNetWorkerror: NetworkServiceError) {
        self.mockError = withNetWorkerror
    }
    
}
