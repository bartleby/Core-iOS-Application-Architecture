//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import UIKit

class MainCoordinator: BaseCoordinator, MainCoordinatorType {
    override func start() {
        let mainModule = container.resolve(MainAssembly.self).build()
        router.setRootModule(mainModule)
    }
    
    override func toPresent() -> UIViewController {
        return router.rootViewController!
    }
}
