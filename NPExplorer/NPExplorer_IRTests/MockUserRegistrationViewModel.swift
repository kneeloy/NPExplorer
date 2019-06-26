//
//  MockUserRegistrationViewModel.swift
//  NPExplorer_IRTests
//
//  Created by niloy.chakraborty on 26/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
import XCTest
@testable import NPExplorer_IR

//class MockUserRegistrationViewModel: UserRegistrationViewModelProtocol_IR {
//    var dataManager: UserRegistrationDataManagerProtocol_IR
//    var mockUserRegistrationReplyModel: UserRegistrationReplyModelProtocol
//    
//    func registerUser(userName: String, password: String, onSuccess: @escaping ((UserRegistrationReplyModelProtocol, URLResponse) -> Void), OnFailure: @escaping ((URLResponse?, NetworkServiceError) -> Void)) {
//        let mockUrlResponse = URLResponse(url: URL(string: "Google.com")!, mimeType: nil, expectedContentLength: 1, textEncodingName: nil)
//        
//        onSuccess(mockUserRegistrationReplyModel, mockUrlResponse)
//    }
//    
//    init(withMockUserRegistrationReplyModel: UserRegistrationReplyModelProtocol) {
//        self.mockUserRegistrationReplyModel = withMockUserRegistrationReplyModel
//    }
//}
