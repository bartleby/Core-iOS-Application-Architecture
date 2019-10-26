//
//  AppConfigService.swift
//  InstaViewer
//
//  Created by Bart on 18.10.2019
//  Copyright © 2019 iDevs.io. All rights reserved.
//

import Foundation

class AppConfigService: AppConfigServiceType {
    fileprivate var userDefaults: UserDefaults {
        return UserDefaults.standard
    }
}

extension AppConfigService {
    func obtain<T>(for key: ConfigKey) -> T {
        guard let value = userDefaults.object(forKey: key.value) else { fatalError("Config key not found") }
        guard let result = value as? T else { fatalError("Expecting another type") }
        return result
    }
    
    func set<T>(value: T, for key: ConfigKey) {
        userDefaults.set(value, forKey: key.value)
        userDefaults.synchronize()
    }
    
    func registerDefaults() {
        userDefaults.register(defaults: ConfigKey.defaultValues)
    }
}

extension AppConfigService {
    
}
