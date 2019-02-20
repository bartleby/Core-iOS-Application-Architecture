//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import Foundation
import UIKit

func measureClosure(title: String, operation:()->()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    print("Time elapsed for \(title): \(timeElapsed) s")
}

public func cycle(_ times: Int, closure: () -> ()) {
    for _ in 0..<times {
        closure()
    }
}

public func between<T: Comparable>(_ minimum: T, maximum: T, value: T) -> T {
    return min( max(minimum, value), maximum)
}

public func degreesToRadians(_ degrees: Double) -> Double {
    return (degrees * Double.pi) / 180.0
}

func randomRange(lower: UInt32 , upper: UInt32) -> UInt32 {
    return lower + arc4random_uniform(upper - lower + 1)
}

func randomString(_ length: Int) -> String {
    
    let letters: NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    let len = UInt32(letters.length)
    
    var randomString = ""
    
    for _ in 0 ..< length {
        let rand = arc4random_uniform(len)
        var nextChar = letters.character(at: Int(rand))
        randomString += NSString(characters: &nextChar, length: 1) as String
    }
    
    return randomString
}

public func printAllAvailableFonts() {
    
    let fontFamilyNames = UIFont.familyNames
    
    for familyName in fontFamilyNames {
        print("------------------------------")
        print("Font Family Name = [\(familyName)]")
        let names = UIFont.fontNames(forFamilyName: familyName )
        print("Font Names = [\(names)]")
    }
}

