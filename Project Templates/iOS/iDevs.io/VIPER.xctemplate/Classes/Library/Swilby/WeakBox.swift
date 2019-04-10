//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import Foundation

protocol WeakBox: class {
    var weakBoxHolder: [String : WeakContainer<AnyObject>] { set get}
}

extension WeakBox {
    func weakBox<T>(_ configure: () -> T) -> T {
        let key = ObjectKey(T.self).key
        if let object = self.weakBoxHolder[key]?.value as? T {
            return object
        }
        let object = configure()
        weakBoxHolder[key] = WeakContainer(value: object as AnyObject)
        return object
    }
}
