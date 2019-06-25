//
//  CountryDetailBaseModel.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 22/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
struct CountryDetailModel: Codable {
    var attributeName: String
    var attributeValue: String
    
    enum CodingKeys: String, CodingKey {
        case attributeName = "name"
        case attributeValue = "value"
    }
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.attributeName = try container.decode(String.self, forKey: .attributeName)
        self.attributeValue = try container.decode(String.self, forKey: .attributeValue)
    }
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.attributeName, forKey: .attributeName)
        try container.encode(self.attributeValue, forKey: .attributeValue)
    }
    
    public init(attributeName: String, attributeValue: String) {
        
        self.attributeName = attributeName
        self.attributeValue = attributeValue
    }
}

//For unit test
protocol CountryDetailModelProtocol {
    
    var attributeName: String { get set }
    var attributeValue: String { get set }
}

extension CountryDetailModel: CountryDetailModelProtocol {}

//CountryDetailModel
struct CountryDetailModelContainer: Codable {
    var countryDetails: [CountryDetailModel]
    
    enum CodingKeys: String, CodingKey {
        case countryDetails = "details"
    }
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.countryDetails = try container.decode([CountryDetailModel].self, forKey: .countryDetails)
    }
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.countryDetails, forKey: .countryDetails)
    }
    
    public init(countryDetails: [CountryDetailModel]) {
        
        self.countryDetails = countryDetails
    }
}

//For unit test
protocol CountryDetailModelContainerProtocol {
    var countryDetails: [CountryDetailModel] { get set }
    
}

extension CountryDetailModelContainer: CountryDetailModelContainerProtocol {}
