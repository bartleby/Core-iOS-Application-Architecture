//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import UIKit

// Module Input
protocol MainModuleInput {
    
}

// Module Output
protocol MainModuleOutput: ModuleOutput {
    
}

// View Input
protocol MainViewInput: AnyObject {
    func set(title: String)
}

// View Output
protocol MainViewOutput: AnyObject {
    func viewDidLoad()
}

// Interactor
protocol MainInteractorInput {

}

// Router
protocol MainRouterProtocol: AlertRoutable {

}
