//
//  UserRegistrationViewModel_IR.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 23/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation



public class UserRegistrationViewModel_IR: UserRegistrationViewModelProtocol_IR {
    var dataManager: UserRegistrationDataManagerProtocol_IR
    let router: UserRegistrationRouterProtocol?
    let userRegistrationContext: UserRegistrationContext?
    
    init(withDataManager: UserRegistrationDataManagerProtocol_IR, withRouter: UserRegistrationRouterProtocol?, userRegistrationContext: UserRegistrationContext?) {
        self.dataManager = withDataManager
        self.router = withRouter
        self.userRegistrationContext = userRegistrationContext
    }
    
    func registerUser(userName: String, password: String, onSuccess: @escaping ((UserRegistrationReplyModelProtocol, URLResponse) -> Void), OnFailure: @escaping ((URLResponse?, NetworkServiceError) -> Void)) {
        
        let registrationForm = UserRegistrationFormModel_IR(userName: userName, password: password)
        dataManager.registerUser(userRegistrationForm: registrationForm, success: { (regReply,urlResponse)  in
            onSuccess(regReply, urlResponse)
        }, failure: { (urlResponse, error) in
            OnFailure(urlResponse, error)
        })
    }
}
