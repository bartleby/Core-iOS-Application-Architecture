//
//  AppConfigServiceAssembly.swift
//  InstaViewer
//
//  Created by Bart on 18.10.2019
//  Copyright © 2019 iDevs.io. All rights reserved.
//

import Foundation

class AppConfigServiceAssembly: Assembly {
    func build() -> AppConfigServiceType {
        let service = AppConfigService()
        return service
    }
}
