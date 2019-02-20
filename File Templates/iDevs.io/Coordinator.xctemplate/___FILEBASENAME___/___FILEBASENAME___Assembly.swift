//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//	___COPYRIGHT___
//

import UIKit

class ___FILEBASENAME___: Assembly {
    func build() -> ___VARIABLE_coordinatorName___Type {
        let navigationController = UINavigationController(rootViewController: UIViewController())
        let router = Router(navigationController: navigationController)

        let coordinator = ___VARIABLE_coordinatorName___(container: container, router: router)
        return coordinator
    }
}
