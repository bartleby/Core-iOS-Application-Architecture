//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import UIKit

class MainViewController: UIViewController, MainViewInput {
    var output: MainViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
    }
}

// MARK: - Configure
extension MainViewController {
    
}

// MARK: View Input
extension MainViewController {
    func set(title: String) {
        self.title = title
    }
}

// MARK: Button Action
extension MainViewController {
    
}
