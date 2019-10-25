//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import UIKit

class ApplicationService: NSObject, AppDelegateService {
    var window: UIWindow?
    let container: DependencyContainer
    
    lazy var appCoordinator: AppCoordinatorType = {
        return self.container.resolve(AppCoordinatorAssembly.self).build()
    }()
    
    init(container: DependencyContainer, window: UIWindow?) {
        self.container = container
        self.window = window
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
        launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // App Config
        let appConfig = container.resolve(AppConfigServiceAssembly.self).build()
        
        // Set defaults
        appConfig.registerDefaults()
        
        // Setup window
        window?.rootViewController = appCoordinator.toPresent()
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        // Configure deep link
        let notification = launchOptions?[.remoteNotification] as? [String: AnyObject]
        let deepLink = DeepLinkOption.build(with: notification)
        appCoordinator.start(with: deepLink)
        
        return true
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification
        userInfo: [AnyHashable : Any]) {
        
        // Configure deep link
        let dict = userInfo as? [String: AnyObject]
        let deepLink = DeepLinkOption.build(with: dict)
        appCoordinator.start(with: deepLink)
    }
    
    func application(_ application: UIApplication, continue
        userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        
        // Configure deep link
        let deepLink = DeepLinkOption.build(with: userActivity)
        appCoordinator.start(with: deepLink)
        
        return true
    }
}
