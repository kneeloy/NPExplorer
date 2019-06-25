//
//  UserRegistrationDataManager.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 23/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation

protocol UserRegistrationDataManagerProtocol_IR {
    //var configUpdater: BaseNetworkClientProtocol? { get set }
    var userRegistrationUpdater: UserRegistrationUpdaterProtocol_IR? { get set }
    
    func registerUser(userRegistrationForm: UserRegistrationFormModel_IR, success: @escaping ((UserRegistrationSuccessModelProtocol, URLResponse)->Void),
                      failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void))
}


public class UserRegistrationDataManager_IR: UserRegistrationDataManagerProtocol_IR {
    //var configUpdater: BaseNetworkClientProtocol?
    var userRegistrationUpdater: UserRegistrationUpdaterProtocol_IR?
    
    init(userRegistrationUpdater: UserRegistrationUpdaterProtocol_IR) {
        self.userRegistrationUpdater = userRegistrationUpdater
    }
    
    func registerUser(userRegistrationForm: UserRegistrationFormModel_IR, success: @escaping ((UserRegistrationSuccessModelProtocol, URLResponse) -> Void), failure: @escaping ((URLResponse?, NetworkServiceError) -> Void)) {
        
        userRegistrationUpdater?.registerUser(userRegistrationForm: userRegistrationForm, success: { (userID,urlResponse)  in
            success(userID, urlResponse)
        }, failure: { (urlResponse, error) in
            failure(urlResponse, error)
        })
    }
}
