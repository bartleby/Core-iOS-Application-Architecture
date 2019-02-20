//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import Foundation

internal struct ObjectKey {
    fileprivate let objectType: Any.Type
    fileprivate let name: String?
    
    fileprivate(set) var key: String {
        get { return String(self.hashValue) }
        set {}
    }
    
    internal init(_ objectType: Any.Type, name: String? = nil) {
        self.objectType = objectType
        self.name = name
    }
}

// MARK: Hashable
extension ObjectKey: Hashable {
    var hashValue: Int {
        return String(describing: objectType).hashValue ^ (name?.hashValue ?? 0)
    }
}

// MARK: Equatable
func == (lhs: ObjectKey, rhs: ObjectKey) -> Bool {
    return lhs.objectType == rhs.objectType && lhs.name == rhs.name
}
