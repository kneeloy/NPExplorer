//
//  CountryDetailsEndpoint.swift
//  NPExplorer_IR
//
//  Created by niloy.chakraborty on 22/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
extension NP_IRAPIClient {
    func getCountryDetails(attributes : [String], success: @escaping ((CountryDetailModelContainerProtocol, URLResponse)->Void), failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void)) {
        guard let listResource = CountryDetailsResource_GR.getCountryDetails(environment: environment, filterAttributes: attributes) else {
            //ToDo: Need to generate and throw some custom error
            return
        }
        getService().execute(withResource: listResource,
                             successHandler: {(data, response) in
                                success(data, response)
        }, errorHandler: {(response, error) in
            failure(response, error)
        })
    }
}
