//
//  File.swift
//  NPExplorer_IR
//
//  Created by niloy.chakraborty on 22/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
import Foundation
struct NetworkEnvironment {
    var defaultLanguage: String
    var apikey: String
    var defaultCountry: String
    init(defaultLang: String, apiKey: String, defaultCountry: String) {
        self.defaultLanguage = defaultLang
        self.apikey = apiKey
        self.defaultCountry = defaultCountry
    }
    
    func netWorkEnvironmentWithApiKey(apiKey: String) -> NetworkEnvironment {
        return NetworkEnvironment(defaultLang: defaultLanguage, apiKey: apiKey, defaultCountry: defaultCountry)
    }
    
    func netWorkEnvironmentWithLang(languageCode: String) -> NetworkEnvironment {
        return NetworkEnvironment(defaultLang: languageCode, apiKey: apikey, defaultCountry: defaultCountry)
    }
    
    func netWorkEnvironmentWithCountry(countryCode: String) -> NetworkEnvironment {
        return NetworkEnvironment(defaultLang: defaultLanguage, apiKey: apikey, defaultCountry: countryCode)
    }
}

struct DefaultNetworkEnvironment {
    var defaultLanguage: String = "en-US"
    var apikey: String = "a874a785f5b47354475d14574a969a7a"
    var defaultCountry: String = "IR"
}
