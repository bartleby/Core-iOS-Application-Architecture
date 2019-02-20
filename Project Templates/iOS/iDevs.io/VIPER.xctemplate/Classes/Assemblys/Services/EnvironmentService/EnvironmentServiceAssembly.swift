//
//  EnvironmentServiceAssembly.swift
//  Exemple
//
//  Created by bart on 19/02/2019
//	Copyright © 2019 idevs. All rights reserved.
//

import Foundation

class EnvironmentServiceAssembly: Assembly {
    func build() -> EnvironmentServiceType {
        let service = EnvironmentService()
        return service
    }
}
