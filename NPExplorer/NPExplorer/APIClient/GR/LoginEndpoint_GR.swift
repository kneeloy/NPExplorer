//
//  LoginEndpoint.swift
//  NPExplorer_IR
//
//  Created by niloy.chakraborty on 22/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation

extension NP_GRAPIClient {
    func authenticateuserUser(userAuthForm: UserAuthenticationFormModel, success: @escaping ((UserAuthenticationReplyModelProtocol, URLResponse)->Void), failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void)) {
        guard let userAuthenticationResource = UserAuthenticationResource_GR.authenticateUser(environment: environment, body: userAuthForm) else {
            //ToDo: Need to generate and throw some custom error
            return
        }
        getService().execute(withResource: userAuthenticationResource,
                             successHandler: {(data, response) in
                                success(data, response)
        }, errorHandler: {(response, error) in
            failure(response, error)
        })
    }
}
