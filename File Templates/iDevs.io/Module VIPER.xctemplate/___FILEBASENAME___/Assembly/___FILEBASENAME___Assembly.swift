//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import UIKit

typealias ___VARIABLE_moduleName___Module = Module<___VARIABLE_moduleName___ModuleInput, ___VARIABLE_moduleName___ModuleOutput>

class ___FILEBASENAME___: Assembly {
    func build() -> ___VARIABLE_moduleName___Module {
        
        // View
        let view = ___VARIABLE_moduleName___ViewController.controllerFromStoryboard("___VARIABLE_moduleName___")
        
        // Interactor
        let interactor = ___VARIABLE_moduleName___Interactor()
        
        // Presenter
        let presenter = ___VARIABLE_moduleName___Presenter(interactor: interactor)
        
        // Dependency Setup
        presenter.view = view
        view.output = presenter
        
        return Module(view: view, input: presenter, output: presenter)
    }
}
