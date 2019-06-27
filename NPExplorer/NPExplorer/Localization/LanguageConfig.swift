//
//  LanguageConfig.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 27/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation

public final class LangConfig : NSObject{
    public static var currentLangCode: String = "en"
    
    @objc static func currentLanguageCode() -> String {
        return currentLangCode
    }
}
