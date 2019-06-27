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
    func getCountryDetailAttributes() -> [String]
    func getCountryDetail(withAttributes: [String], success: @escaping ((CountryDetailModelContainerProtocol, URLResponse)->Void),
                          failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void))
    func fetchCountryDetailAttributes(attributes: [String],
    success: @escaping ((CountryDetailAttributeModelContainerProtocol, URLResponse)->Void),
    failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void))
}

struct CountryDetailContext {
    var countryCode: CountryCode
}

public class CountryDetailViewModel: CountryDetailViewModelProtocol {
    
    var dataManager: CountryDetailDataManagerProtocol
    let router: CountryDetailRouterProtocol?
    let countryDetailContext: CountryDetailContext
    private var selectedAttributes: [String]?
    
    init(withDataManager: CountryDetailDataManagerProtocol, withRouter: CountryDetailRouterProtocol?, countryDetailContext: CountryDetailContext) {
        self.dataManager = withDataManager
        self.router = withRouter
        self.countryDetailContext = countryDetailContext
    }
    
    func getCountryDetailAttributes() -> [String] {
        return [""] //ToDo
    }
    
    func getCountryDetail(withAttributes: [String], success: @escaping ((CountryDetailModelContainerProtocol, URLResponse)->Void),
                                 failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void)) {
        
    }
    
    func fetchCountryDetailAttributes(attributes: [String],
                                              success: @escaping ((CountryDetailAttributeModelContainerProtocol, URLResponse)->Void),
                                              failure: @escaping ((_ response: URLResponse?, _ error: NetworkServiceError)->Void)) {
        dataManager.getCountryDetailAttributes(success: {(attrb,_) in
            print(attrb)
            }, failure: { _,_ in
                print("Fail")
        })
    }
    
}
