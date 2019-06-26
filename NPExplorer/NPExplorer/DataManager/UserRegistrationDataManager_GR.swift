//
//  UserRegistrationDataManager_GR.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 23/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation

protocol UserRegistrationDataManagerProtocol_GR {
    //var configUpdater: BaseNetworkClientProtocol? { get set }
    var userRegistrationUpdater: UserRegistrationUpdaterProtocol_GR? { get set }
    
    func registerUser(userRegistrationForm: UserRegistrationFormModel_GR, success: @escaping ((UserRegistrationReplyModelProtocol, URLResponse)->Void),
                      failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void))
}


public class UserRegistrationDataManager_GR: UserRegistrationDataManagerProtocol_GR {
    //var configUpdater: BaseNetworkClientProtocol?
    var userRegistrationUpdater: UserRegistrationUpdaterProtocol_GR?
    
//    init(withConfigUpdater: BaseNetworkClientProtocol = BaseGRNetworkClient(),
//         userRegistrationUpdater: UserRegistrationUpdaterProtocol_GR) {
//        self.configUpdater = withConfigUpdater
//        self.userRegistrationUpdater = userRegistrationUpdater
//    }
    init(userRegistrationUpdater: UserRegistrationUpdaterProtocol_GR) {
        //self.configUpdater = withConfigUpdater
        self.userRegistrationUpdater = userRegistrationUpdater
    }
    
    func registerUser(userRegistrationForm: UserRegistrationFormModel_GR, success: @escaping ((UserRegistrationReplyModelProtocol, URLResponse) -> Void), failure: @escaping ((URLResponse?, NetworkServiceError) -> Void)) {
        
        userRegistrationUpdater?.registerUser(userRegistrationForm: userRegistrationForm, success: { (userID,urlResponse)  in
            success(userID, urlResponse)
        }, failure: { (urlResponse, error) in
            failure(urlResponse, error)
        })
    }
}
