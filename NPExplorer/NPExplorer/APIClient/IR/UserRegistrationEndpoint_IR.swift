//
//  UserRegistrationEndpoint.swift
//  NPExplorer_IR
//
//  Created by niloy.chakraborty on 22/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation

extension NP_IRAPIClient {
    func registerUser(userRegistrationForm: UserRegistrationFormModel_IR, success: @escaping ((UserRegistrationSuccessModelProtocol, URLResponse)->Void), failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void)) {
        guard let userRegistrationResource = UserRegistrationResource_IR.registerUser(environment: environment, body: userRegistrationForm) else {
            //ToDo: Need to generate and throw some custom error
            return
        }
        getService().execute(withResource: userRegistrationResource,
                             successHandler: {(data, response) in
                                success(data, response)
        }, errorHandler: {(response, error) in
            failure(response, error)
        })
    }
}
