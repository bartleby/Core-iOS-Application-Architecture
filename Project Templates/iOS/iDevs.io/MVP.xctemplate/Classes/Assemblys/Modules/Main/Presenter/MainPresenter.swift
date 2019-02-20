//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import Foundation

class MainPresenter: MainModuleOutput {
        
    init(view: MainViewInput) {
        self.view = view
    }
    
    // MARK: - Weak properties
    weak var view: MainViewInput?
}

// MARK: Private
extension MainPresenter {
    
}

// MARK: Module Input
extension MainPresenter: MainModuleInput {
    
}


// MARK: View Output
extension MainPresenter: MainViewOutput {
    func viewDidLoad() {
        
    }
}
