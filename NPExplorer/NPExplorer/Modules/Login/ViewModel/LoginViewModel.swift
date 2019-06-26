//
//  loginViewModel_IR.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 23/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
protocol LoginViewModelProtocol {
    
    var dataManager: LoginDataManagerProtocol { get }
    func authenticateUser(userName: String, password: String?, onSuccess: @escaping ((UserAuthenticationReplyModelProtocol, URLResponse)->Void), OnFailure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void))
    func navigateToCountryDetailPage() -> Void
    func navigateToUserRegistrationPage() -> Void
    func shouldDisplayPasswordField() -> Bool
}

public enum CountryCode: String {
    case ireland = "IR"
    case germany = "GR"
}
struct LoginContext {
    var countryCode: CountryCode
}

public class LoginViewModel: LoginViewModelProtocol {
    var dataManager: LoginDataManagerProtocol
    let router: LoginRouterProtocol?
    let loginContext: LoginContext
    
    init(withDataManager: LoginDataManagerProtocol, withRouter: LoginRouterProtocol?, loginContext: LoginContext) {
        self.dataManager = withDataManager
        self.router = withRouter
        self.loginContext = loginContext
    }
    
    func authenticateUser(userName: String, password: String?, onSuccess: @escaping ((UserAuthenticationReplyModelProtocol, URLResponse) -> Void), OnFailure: @escaping ((URLResponse?, NetworkServiceError) -> Void)) {
        
        let loginForm = UserAuthenticationFormModel(userName: userName, password: password)
        dataManager.authenticateUser(userAuthForm: loginForm, success: { (token,urlResponse)  in
            onSuccess(token, urlResponse)
        }, failure: { (urlResponse, error) in
            OnFailure(urlResponse, error)
        })
    }
    
    func shouldDisplayPasswordField() -> Bool {
        switch loginContext.countryCode {
        case CountryCode.ireland:
            return false
        case CountryCode.germany:
            return true
        }
    }
    
    func navigateToCountryDetailPage() {
        router?.routeToCountryDetailPage()
    }
    
    func navigateToUserRegistrationPage() {
        router?.routeToRegisterPage()
    }

}
