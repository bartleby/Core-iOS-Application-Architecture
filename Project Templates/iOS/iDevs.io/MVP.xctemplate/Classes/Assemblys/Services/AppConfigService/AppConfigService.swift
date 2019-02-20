//
//  AppConfigService.swift
//  Exemple
//
//  Created by bart on 17/02/2019
//  Copyright © 2019 idevs. All rights reserved.
//

import Foundation

class AppConfigService: AppConfigServiceType {
    fileprivate var userDefaults: UserDefaults {
        return UserDefaults.standard
    }
}

extension AppConfigService {
    func obtainConfig<T>(for key: ConfigKey) -> T {
        guard let value = userDefaults.object(forKey: key.value) else { fatalError("Config key not found") }
        guard let result = value as? T else { fatalError("Expecting another type") }
        return result
    }
    
    func setConfig<T>(value: T, for key: ConfigKey) {
        userDefaults.set(value, forKey: key.value)
        userDefaults.synchronize()
    }
    
    func registerDefaults() {
        userDefaults.register(defaults: ConfigKey.defaultValues)
    }
}

extension AppConfigService {
    
}
