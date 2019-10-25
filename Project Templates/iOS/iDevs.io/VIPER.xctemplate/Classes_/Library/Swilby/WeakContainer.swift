//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import Foundation

class WeakContainer<T> {
    fileprivate weak var _value: AnyObject?
    var value: T? {
        set { self._value = newValue as AnyObject }
        get { return _value as? T }
    }
    
    init(value: T) {
        self._value = value as AnyObject
    }
}
