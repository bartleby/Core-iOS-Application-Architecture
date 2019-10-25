//
//  EnvironmentServiceAssembly.swift
//  InstaViewer
//
//  Created by Bart on 18.10.2019
//  Copyright © 2019 iDevs.io. All rights reserved.
//

import Foundation

class EnvironmentServiceAssembly: Assembly {
    func build() -> EnvironmentServiceType {
        let service = EnvironmentService()
        return service
    }
}
