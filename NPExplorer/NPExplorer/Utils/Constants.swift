//
//  Constants_IR.swift
//  NPExplorer_IR
//
//  Created by niloy.chakraborty on 23/06/2019.
//  Copyright © 2019 niloy.chakraborty. All rights reserved.
//

import Foundation

//
let storyBoardFileName = "NPExplorer"
let welcomeLogoText = "WelcomeLogoText"
let loginPageText = "LoginPageText"
let alertButtonOKText = "OK"
let alertTitleSuccessText = "Success"
let alertTitleErrorText = "Error"

let countryDetailScreenStoryBoardIdentifier = "CountryDetail"
#if MARKET_IR
let userRegistrationScreenStoryBoardIdentifier = "UserRegistration_IR"
#elseif MARKET_GR
let userRegistrationScreenStoryBoardIdentifier = "UserRegistration_GR"

#endif
//Registration
let userRegistrationSuccessMessage = "User Added"
let userRegistrationErrorMessage = "User Already Exist"

//Login
let userAuthenticationFailureMessage = "Login Error"
