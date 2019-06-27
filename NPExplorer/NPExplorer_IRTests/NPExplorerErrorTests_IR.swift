//
//  NPExplorerErrorTests_IR.swift
//  NPExplorer_IRTests
//
//  Created by niloy.chakraborty on 28/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import XCTest
@testable import NPExplorer_IR

class NPExplorerErrorTests_IR: XCTestCase {

    var mockErrorDataManager: MockUserRegistrationErrorDataManager_IR!
    var viewModel: UserRegistrationViewModel_IR!
    
    
    
    override func setUp() {
        let error = NetworkServiceError.cancelled
        let mockErrorDataManager = MockUserRegistrationErrorDataManager_IR(withNetWorkerror: error)
            viewModel = UserRegistrationViewModel_IR(withDataManager: mockErrorDataManager, withRouter: nil, userRegistrationContext: nil)
    }
    
    override func tearDown() {
        super.tearDown()
        mockErrorDataManager = nil
        viewModel = nil
    }
    
    func testItCanHandleNetworkCallFail() {
        viewModel.registerUser(userName: "TestUser1", password: "TestPassword1", onSuccess: { [weak self] registrationReply, _ in
            
            XCTFail("Error")
            }, OnFailure: {_,error in
                switch error {
                case NetworkServiceError.cancelled:
                    XCTAssert(true)
                    break
                default:
                    XCTFail("Error")
                }
        })
    }
}
