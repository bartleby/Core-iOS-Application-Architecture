//
//  AppConfigServiceProtocol.swift
//  Exemple
//
//  Created by bart on 17/02/2019
//  Copyright © 2019 idevs. All rights reserved.
//

import Foundation

enum ConfigKey: String {
    case authToken = "authToken"
    case onboardingWasShown = "onboardingWasShown"
    
    var value: String {
        return self.rawValue
    }
    
    static var defaultValues: [String: Any] = [
        ConfigKey.authToken.value: "",
        ConfigKey.onboardingWasShown.value: false
    ]
}

protocol AppConfigServiceType {
    func obtainConfig<T>(for key: ConfigKey) -> T
    func setConfig<T>(value: T, for key: ConfigKey)
    
    func registerDefaults()
}
