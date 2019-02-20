//
//  EnvironmentServiceType.swift
//  Exemple
//
//  Created by bart on 19/02/2019
//	Copyright © 2019 idevs. All rights reserved.
//

import Foundation

enum EnvironmentKey: String {
    case apiEndpoint = "api_endpoint"
    case apiVersion = "api_version"
    case appVersion = "CFBundleShortVersionString"
    case buildNumber = "CFBundleVersion"
    
    var value: String {
        return self.rawValue
    }
}

protocol EnvironmentServiceType {
    var apiURL: URL { get }
	func obtainEnvironment<T>(for key: EnvironmentKey) -> T
}
