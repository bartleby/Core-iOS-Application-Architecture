//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import Foundation

public func delay(_ delay: Double, closure: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}

enum Queue {
    case main // main queue
    case userInitiated // small and urgent actions
    case `default` // network tasks, rendering
    case utility // network tasks, rendering
    case background // long-term processes
    
    func async(_ closure: @escaping () -> Void) {
        switch self {
        case .main:
            DispatchQueue.main.async(execute: closure)
        case .userInitiated:
            DispatchQueue.global(qos: .userInitiated).async(execute: closure)
        case .default:
            DispatchQueue.global(qos: .default).async(execute: closure)
        case .utility:
            DispatchQueue.global(qos: .utility).async(execute: closure)
        case .background:
            DispatchQueue.global(qos: .background).async(execute: closure)
        }
    }
}
