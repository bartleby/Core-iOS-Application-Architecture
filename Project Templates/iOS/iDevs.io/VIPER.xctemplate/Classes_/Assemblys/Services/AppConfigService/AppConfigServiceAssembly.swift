//
//  AppConfigServiceAssembly.swift
//  Exemple
//
//  Created by bart on 17/02/2019
//  Copyright © 2019 idevs. All rights reserved.
//

import Foundation

class AppConfigServiceAssembly: Assembly {
    func build() -> AppConfigServiceType {
        let service = AppConfigService()
        return service
    }
}
