//
//  AppConfigServiceType.swift
//  InstaViewer
//
//  Created by Bart on 18.10.2019
//  Copyright © 2019 iDevs.io. All rights reserved.
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
    func obtain<T>(for key: ConfigKey) -> T
    func set<T>(value: T, for key: ConfigKey)
    
    func registerDefaults()
}
