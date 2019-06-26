//
//  CountryDetailUpdater.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 24/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
protocol CountryDetailUpdaterProtocol {
    
    func getCountryDetail(attributes: [String], success: @escaping ((CountryDetailModelContainerProtocol, URLResponse)->Void),
                          failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void))
    
    func getCountryDetailAttributes(success: @escaping ((CountryDetailAttributeModelContainerProtocol, URLResponse)->Void),
                          failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void))
}


class CountryDetailUpdater_IR: BaseIRNetworkClient, CountryDetailUpdaterProtocol {
    
    func getCountryDetail(attributes: [String], success: @escaping ((CountryDetailModelContainerProtocol, URLResponse)->Void),
                          failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void)) {
        client.getCountryDetails(attributes: attributes, success: success, failure: failure)
    }
    
    func getCountryDetailAttributes(success: @escaping ((CountryDetailAttributeModelContainerProtocol, URLResponse)->Void),
                          failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void)) {
        client.getCountryDetailsAttributes(success: success, failure: failure)
    }
}

class CountryDetailUpdater: BaseGRNetworkClient, CountryDetailUpdaterProtocol {
    
    func getCountryDetail(attributes: [String], success: @escaping ((CountryDetailModelContainerProtocol, URLResponse)->Void),
                          failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void)) {
        client.getCountryDetails(attributes: attributes, success: success, failure: failure)
    }
    
    func getCountryDetailAttributes(success: @escaping ((CountryDetailAttributeModelContainerProtocol, URLResponse)->Void),
                          failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void)) {
        client.getCountryDetailsAttributes(success: success, failure: failure)
    }
}
