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
        
        // Interactor
        let interactor = MainInteractor()
        
        // Presenter
        let presenter = MainPresenter(interactor: interactor)
        
        // Dependency Setup
        presenter.view = view
        view.output = presenter
        
        return Module(view: view, input: presenter, output: presenter)
    }
}
