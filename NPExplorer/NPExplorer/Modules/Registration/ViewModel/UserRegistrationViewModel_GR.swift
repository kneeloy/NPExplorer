//
//  UserRegistrationViewModel_GR.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 23/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation


public class UserRegistrationViewModel_GR: UserRegistrationViewModelProtocol_GR {
    var dataManager: UserRegistrationDataManagerProtocol_GR
    let router: UserRegistrationRouterProtocol?
    let userRegistrationContext: UserRegistrationContext
    
    init(withDataManager: UserRegistrationDataManagerProtocol_GR, withRouter: UserRegistrationRouterProtocol?, userRegistrationContext: UserRegistrationContext) {
        self.dataManager = withDataManager
        self.router = withRouter
        self.userRegistrationContext = userRegistrationContext
    }
    
    func registerUser(passcode: String, onSuccess: @escaping ((UserRegistrationSuccessModelProtocol, URLResponse) -> Void), OnFailure: @escaping ((URLResponse?, NetworkServiceError) -> Void)) {
        
        let registrationForm = UserRegistrationFormModel_GR(passCode: passcode)
        dataManager.registerUser(userRegistrationForm: registrationForm, success: { (token,urlResponse)  in
            onSuccess(token, urlResponse)
        }, failure: { (urlResponse, error) in
            OnFailure(urlResponse, error)
        })
    }
}
