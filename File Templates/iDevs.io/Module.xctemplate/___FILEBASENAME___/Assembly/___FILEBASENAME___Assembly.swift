//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import UIKit

typealias ___VARIABLE_moduleName___Module = Module<___VARIABLE_moduleName___ModuleInput, ___VARIABLE_moduleName___ModuleOutput>

class ___VARIABLE_moduleName___Assembly: Assembly {
    func build(coordinator: CoordinatorType) -> ___VARIABLE_moduleName___Module {
        // View
        let view = ___VARIABLE_moduleName___ViewController.controllerFromStoryboard("___VARIABLE_moduleName___")
        
        // Interactor
        let interactor = ___VARIABLE_moduleName___Interactor()
        
        // Router
        let router = ___VARIABLE_moduleName___Router(coordinator: coordinator)
        
        // Presenter
        let presenter = ___VARIABLE_moduleName___Presenter(interactor: interactor, router: router)
        
        // Dependency Setup
        presenter.view = view
        view.output = presenter
        
        return Module(view: view, input: presenter, output: presenter)
    }
}
