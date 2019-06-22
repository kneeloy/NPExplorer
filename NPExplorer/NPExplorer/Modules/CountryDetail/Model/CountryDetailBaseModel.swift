//
//  CountryDetailBaseModel.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 22/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
struct CountryDetailBaseModel: Codable {
    var name: Int?
    var population: Int?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case population = "population"
    }
}

//For unit test
protocol CountryDetailBaseModelProtocol {
    var name: Int? { get set }
    var population: Int? { get set }
}

extension CountryDetailBaseModel: CountryDetailBaseModelProtocol {}
