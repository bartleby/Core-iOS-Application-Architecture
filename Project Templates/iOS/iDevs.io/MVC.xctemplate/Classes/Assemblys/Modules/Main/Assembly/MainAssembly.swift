//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import UIKit

class MainAssembly: Assembly {
    func build() -> Module<MainModuleInput, MainModuleOutput> {
        
        // View
        let view = MainViewController.controllerFromStoryboard(.main)
        
        return Module(view: view, input: view, output: view)
    }
}
