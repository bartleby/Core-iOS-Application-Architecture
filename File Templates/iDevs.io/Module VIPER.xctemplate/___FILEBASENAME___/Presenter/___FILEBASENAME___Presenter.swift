//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import Foundation

class ___FILEBASENAME___: ___VARIABLE_moduleName___ModuleOutput {
    fileprivate let interactor: ___VARIABLE_moduleName___InteractorInput
    
    init(interactor: ___VARIABLE_moduleName___InteractorInput) {
        self.interactor = interactor
    }
    
    // MARK: - Weak properties
    weak var view: ___VARIABLE_moduleName___ViewInput?
}

// MARK: Private
extension ___VARIABLE_moduleName___Presenter {
    
}

// MARK: Module Input
extension ___VARIABLE_moduleName___Presenter: ___VARIABLE_moduleName___ModuleInput {
    
}

// MARK: View Output
extension ___VARIABLE_moduleName___Presenter: ___VARIABLE_moduleName___ViewOutput {
    func viewDidLoad() {
        
    }
}
