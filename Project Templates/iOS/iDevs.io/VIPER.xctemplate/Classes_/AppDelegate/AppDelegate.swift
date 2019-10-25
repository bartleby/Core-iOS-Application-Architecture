//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import UIKit

@UIApplicationMain
class AppDelegate: AppDelegateManager {
    var window: UIWindow? = UIWindow()
    
    lazy var container: DependencyContainer = {
        let factory = AssemblyFactory()
        let container = DependencyContainer(assemblyFactory: factory)
        
        // Setup Coordinators
        container.apply(AppCoordinatorAssembly.self)
        container.apply(MainCoordinatorAssembly.self)
        
        // Setup Modules
        container.apply(MainAssembly.self)
        
        // Setup Services
        container.apply(AppConfigServiceAssembly.self)
        container.apply(EnvironmentServiceAssembly.self)
        
        
        return container
    }()
    
    override var services: [AppDelegateService] {
        return [
            ApplicationService(container: container, window: window)
        ]
    }
}

