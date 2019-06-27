//
//  CountryDetailAttributeModel.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 25/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
struct CountryDetailAttributeModel: Codable {
    var attributeName: String
    //ToDo vaue should not be a part of this model, there should be a separate API to support just the attribute name/value pair depending on the requested attribute
    var attributeValue: String
    var landscapeModeAvailability: Bool
    var portraitModeAvailability: Bool
    
    enum CodingKeys: String, CodingKey {
        case attributeName = "attributeName"
        case attributeValue = "attributeValue"
        case landscapeModeAvailability = "availableInLandscape"
        case portraitModeAvailability = "availableInPortrait"
    }
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.attributeName = try container.decode(String.self, forKey: .attributeName)
        self.attributeValue = try container.decode(String.self, forKey: .attributeValue)
        self.landscapeModeAvailability = try container.decode(Bool.self, forKey: .landscapeModeAvailability)
        self.portraitModeAvailability = try container.decode(Bool.self, forKey: .portraitModeAvailability)
    }
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.attributeName, forKey: .attributeName)
        try container.encode(self.attributeValue, forKey: .attributeValue)
        try container.encode(self.landscapeModeAvailability, forKey: .landscapeModeAvailability)
        try container.encode(self.portraitModeAvailability, forKey: .portraitModeAvailability)
    }
    
    public init(attributeName: String, attributeValue: String, inLandscape: Bool, inPortrait: Bool) {
        
        self.attributeName = attributeName
        self.attributeValue = attributeValue
        self.landscapeModeAvailability = inLandscape
        self.portraitModeAvailability = inPortrait
    }
}

protocol CountryDetailAttributeModelProtocol {
    var attributeName: String { get set }
    var attributeValue: String { get set }
    var landscapeModeAvailability: Bool { get set }
    var portraitModeAvailability: Bool { get set }
}

extension CountryDetailAttributeModel: CountryDetailAttributeModelProtocol {}


struct CountryDetailAttributeModelContainer: Codable {
    var attributes: [CountryDetailAttributeModel]
    
    enum CodingKeys: String, CodingKey {
        case attributes = "attributesList"
    }
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.attributes = try container.decode([CountryDetailAttributeModel].self, forKey: .attributes)
    }
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.attributes, forKey: .attributes)
       
    }
    
    public init(attributes: [CountryDetailAttributeModel]) {
        
        self.attributes = attributes
    }
}

protocol CountryDetailAttributeModelContainerProtocol {
    
    var attributes: [CountryDetailAttributeModel] { get set }
}

extension CountryDetailAttributeModelContainer: CountryDetailAttributeModelContainerProtocol {}
