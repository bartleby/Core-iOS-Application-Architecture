//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import Foundation

struct ActionBox {
    typealias Action = () -> Void
    let action: Action
}

class ActionCloud {
    var actions = [String: ActionBox]()
    
    func add(eventKey: String, action: @escaping ActionBox.Action) {
        actions[eventKey] = ActionBox(action: action)
    }
    
    func run(_ actionKey: String) {
        if let actionBox = actions[actionKey] {
            actionBox.action()
        }
    }
}
