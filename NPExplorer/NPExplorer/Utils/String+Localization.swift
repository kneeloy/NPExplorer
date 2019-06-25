//
//  String+Localization.swift
//  NPExplorer
//
//  Created by niloy.chakraborty on 24/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation
extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
}
