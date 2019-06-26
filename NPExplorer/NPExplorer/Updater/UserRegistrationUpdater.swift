//
//  UserRegistrationUpdater_IR.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 23/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
protocol UserRegistrationUpdaterProtocol_IR {
    
    func registerUser(userRegistrationForm: UserRegistrationFormModel_IR, success: @escaping ((UserRegistrationReplyModelProtocol, URLResponse)->Void),
                          failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void))
}

protocol UserRegistrationUpdaterProtocol_GR {
    
    func registerUser(userRegistrationForm: UserRegistrationFormModel_GR, success: @escaping ((UserRegistrationReplyModelProtocol, URLResponse)->Void),
                      failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void))
}

class UserRegistrationUpdater_IR: BaseIRNetworkClient, UserRegistrationUpdaterProtocol_IR {
    func registerUser(userRegistrationForm: UserRegistrationFormModel_IR, success: @escaping ((UserRegistrationReplyModelProtocol, URLResponse)->Void),
                          failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void)) {
        client.registerUser(userRegistrationForm: userRegistrationForm, success: success, failure: failure)
        
    }
}

class UserRegistrationUpdater_GR: BaseGRNetworkClient, UserRegistrationUpdaterProtocol_GR {
    func registerUser(userRegistrationForm: UserRegistrationFormModel_GR, success: @escaping ((UserRegistrationReplyModelProtocol, URLResponse)->Void),
                          failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void)) {
        client.registerUser(userRegistrationForm: userRegistrationForm, success: success, failure: failure)
    }
}
