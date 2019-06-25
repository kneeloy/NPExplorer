//
//  CountryDetailAttributesEndpoint_IR.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 25/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
extension NP_IRAPIClient {
    func getCountryDetailsAttributes(success: @escaping ((CountryDetailAttributeModelContainerProtocol, URLResponse)->Void), failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void)) {
        guard let listResource = CountryDetailsAttributesResource_GR.getCountryDetailAttributes(environment: environment) else {
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
