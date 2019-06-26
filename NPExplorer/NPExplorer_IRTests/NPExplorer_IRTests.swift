//
//  NPExplorer_IRTests.swift
//  NPExplorer_IRTests
//
//  Created by niloy.chakraborty on 26/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import XCTest
@testable import NPExplorer_IR

class NPExplorer_IRTests: XCTestCase {
    
    var mockSuccessReplyModel: MockUserRegistrationReplyModel!
    var mockSuccessDataManager: MockUserRegistrationDataManager_IR!
    var successViewModel: UserRegistrationViewModel_IR!
    
    var mockFailReplyModel: MockUserRegistrationReplyModel!
    var mockFailDataManager: MockUserRegistrationDataManager_IR!
    var failViewModel: UserRegistrationViewModel_IR!
    
    let successStatus = "OK"
    let failStatus = "OK"
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockSuccessReplyModel = MockUserRegistrationReplyModel(registrationStatus: successStatus)
        mockSuccessDataManager = MockUserRegistrationDataManager_IR(withMockUserRegistrationReplyModel: mockSuccessReplyModel)
        successViewModel = UserRegistrationViewModel_IR(withDataManager: mockSuccessDataManager, withRouter: nil, userRegistrationContext: nil)
        
        mockFailReplyModel = MockUserRegistrationReplyModel(registrationStatus: failStatus)
        mockFailDataManager = MockUserRegistrationDataManager_IR(withMockUserRegistrationReplyModel: mockFailReplyModel)
        failViewModel = UserRegistrationViewModel_IR(withDataManager: mockFailDataManager, withRouter: nil, userRegistrationContext: nil)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        mockSuccessReplyModel = nil
        mockSuccessDataManager = nil
        successViewModel = nil
        mockFailReplyModel = nil
        mockFailDataManager = nil
        failViewModel = nil
    }

    func testViewModelCanHandleSuccessfulUserRegisteration() {
        successViewModel.registerUser(userName: "TestUser1", password: "TestPassword1", onSuccess: { [weak self] registrationReply, _ in
            
            XCTAssertEqual(registrationReply.registrationStatus, self?.successStatus)
        }, OnFailure: {_,_ in
            XCTFail("Error")
            return
        })
    }
    
    func testViewModelCanHandleUnsuccessfulUserRegisteration() {
        successViewModel.registerUser(userName: "TestUser1", password: "TestPassword1", onSuccess: { [weak self] registrationReply, _ in
            
            XCTAssertEqual(registrationReply.registrationStatus, self?.failStatus)
            }, OnFailure: {_,_ in
                XCTFail("Error")
                return
        })
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
