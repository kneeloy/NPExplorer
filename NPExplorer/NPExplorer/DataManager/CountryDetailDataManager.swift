//
//  CountryDetailDataManager.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 24/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
protocol CountryDetailDataManagerProtocol {
    //var configUpdater: BaseNetworkClientProtocol? { get set }
    var countryDetailUpdater: CountryDetailUpdaterProtocol? { get set }
    
    func getCountryDetail(attributes: [String], success: @escaping ((CountryDetailModelContainerProtocol, URLResponse)->Void),
                          failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void))
    
    func getCountryDetailAttributes(success: @escaping ((CountryDetailAttributeModelContainerProtocol, URLResponse)->Void),
                          failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void))
}


public class CountryDetailDataManager: CountryDetailDataManagerProtocol {
    //var configUpdater: BaseNetworkClientProtocol?
    var countryDetailUpdater: CountryDetailUpdaterProtocol?
    
    init(countryDetailUpdater: CountryDetailUpdaterProtocol) {
        self.countryDetailUpdater = countryDetailUpdater
    }
    
    func getCountryDetail(attributes: [String], success: @escaping ((CountryDetailModelContainerProtocol, URLResponse)->Void),
                          failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void)) {
        
        countryDetailUpdater?.getCountryDetail(attributes: attributes, success: {(countryDetail,urlResponse)  in
            success(countryDetail, urlResponse)
        }, failure: {(urlResponse, error) in
            failure(urlResponse, error)
        })
    }
    
    func getCountryDetailAttributes(success: @escaping ((CountryDetailAttributeModelContainerProtocol, URLResponse)->Void),
                          failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void)) {
        
        countryDetailUpdater?.getCountryDetailAttributes(success: {(countryDetail,urlResponse)  in
            success(countryDetail, urlResponse)
        }, failure: {(urlResponse, error) in
            failure(urlResponse, error)
        })
    }
}
