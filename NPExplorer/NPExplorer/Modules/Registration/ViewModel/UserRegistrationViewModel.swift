//
//  UserRegistrationViewModel.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 23/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
protocol UserRegistrationViewModelProtocol_IR {
    
    var dataManager: UserRegistrationDataManagerProtocol_IR { get }
    func registerUser(userName: String, password: String, onSuccess: @escaping ((UserRegistrationReplyModelProtocol, URLResponse)->Void),
                      OnFailure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void))
}
protocol UserRegistrationViewModelProtocol_GR {
    
    var dataManager: UserRegistrationDataManagerProtocol_GR { get }
    func registerUser(passcode: String, onSuccess: @escaping ((UserRegistrationReplyModelProtocol, URLResponse)->Void),
                      OnFailure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void))
}

struct UserRegistrationContext {
    var countryCode: CountryCode
}
