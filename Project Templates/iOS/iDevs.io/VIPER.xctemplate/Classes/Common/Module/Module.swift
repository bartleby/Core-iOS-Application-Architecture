//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import UIKit

protocol ModuleOutput {
    
}

struct Module<Input, Output>: Presentable {
    var view: UIViewController
    var input: Input
    var output: Output
    
    func toPresent() -> UIViewController {
        return view
    }
}
