//
//  CountryDetailViewModel.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 24/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
protocol CountryDetailViewModelProtocol {
    
    var dataManager: CountryDetailDataManagerProtocol { get }
    var isLandscape: Bool { get set }
    func getCountryDetailAttributes() -> [String]?
    func getCountryDetail(withAttributes: [String], success: @escaping ((CountryDetailModelContainerProtocol, URLResponse)->Void),
                          failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void))
    func fetchCountryDetailAttributes(attributes: [String],
    success: @escaping ((CountryDetailAttributeModelContainerProtocol, URLResponse)->Void),
    failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void))
}

struct CountryDetailContext {
    var countryCode: CountryCode
    var isLandscape: Bool
}

public class CountryDetailViewModel: CountryDetailViewModelProtocol {
    
    var dataManager: CountryDetailDataManagerProtocol
    let router: CountryDetailRouterProtocol?
    let countryDetailContext: CountryDetailContext
    var isLandscape: Bool
    private var attributes: [CountryDetailAttributeModel]?
    
    init(withDataManager: CountryDetailDataManagerProtocol, withRouter: CountryDetailRouterProtocol?, countryDetailContext: CountryDetailContext) {
        self.dataManager = withDataManager
        self.router = withRouter
        self.countryDetailContext = countryDetailContext
        self.isLandscape = countryDetailContext.isLandscape
    }
    
    func getCountryDetailAttributes() -> [String]? {
        return attributes?.reduce([String](), { [weak self] initialVal, attrb in
            if !self!.isLandscape {
                if attrb.portraitModeAvailability {
                    var list = initialVal
                    list.append(attrb.attributeName)
                    return list
                } else {
                    return initialVal
                }
            } else {
                if attrb.landscapeModeAvailability {
                    var list = initialVal
                    list.append(attrb.attributeName)
                    return list
                } else {
                    return initialVal
                }
            }
        })
    }
    
    func getCountryDetail(withAttributes: [String], success: @escaping ((CountryDetailModelContainerProtocol, URLResponse)->Void),
                                 failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void)) {
        
    }
    
    func fetchCountryDetailAttributes(attributes: [String],
                                              success: @escaping ((CountryDetailAttributeModelContainerProtocol, URLResponse)->Void),
                                              failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void)) {
        dataManager.getCountryDetailAttributes(success: { [weak self] (attrb,response) in
            self?.attributes = attrb.attributes
            success(attrb, response)
            }, failure: { _,_ in
                print("Fail")
        })
    }
    
}
