//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import UIKit

class ___VARIABLE_moduleName___ViewController: UITableViewController, ___VARIABLE_moduleName___ViewInput {
    var output: ___VARIABLE_moduleName___ViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
    }
}

// MARK: - Configure
extension ___VARIABLE_moduleName___ViewController {
    
}

// MARK: View Input
extension ___VARIABLE_moduleName___ViewController {
    func set(title: String) {
        self.title = title
    }
}

// MARK: Button Action
extension ___VARIABLE_moduleName___ViewController {
    
}
