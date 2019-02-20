//
//  EnvironmentService.swift
//  Exemple
//
//  Created by bart on 19/02/2019
//	Copyright © 2019 idevs. All rights reserved.
//

import Foundation

class EnvironmentService: EnvironmentServiceType {
    fileprivate var infoDictionary: [String: Any] {
        guard let dict = Bundle.main.infoDictionary else { fatalError("Plist file not found") }
        return dict
    }
    
    lazy var apiURL: URL = {
        let apiEndpoint: String = obtainEnvironment(for: .apiEndpoint)
        let apiVersion: String = obtainEnvironment(for: .apiVersion)
        return URL(string: "\(apiEndpoint)/\(apiVersion)")!
    }()
}

extension EnvironmentService {
    func obtainEnvironment<T>(for key: EnvironmentKey) -> T {
        guard let value = infoDictionary[key.value] else { fatalError("Plist key not found") }
        guard let result = value as? T else { fatalError("Expecting another type") }
        return result
    }
}
