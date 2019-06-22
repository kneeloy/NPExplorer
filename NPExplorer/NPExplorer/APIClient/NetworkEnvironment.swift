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
    init(defaultLang: String, apiKey: String) {
        defaultLanguage = defaultLang
        apikey = apiKey
    }
}

struct DefaultNetworkEnvironment {
    var defaultLanguage: String = "en-US"
    var apikey: String = "a874a785f5b47354475d14574a969a7a"
}
