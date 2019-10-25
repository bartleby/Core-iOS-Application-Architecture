//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import UIKit


final class Router: NSObject, RouterType {
    typealias RouterCompletion = () -> Void
    private var completions: [UIViewController : RouterCompletion]
    
    public let navigationController: UINavigationController
    public var rootViewController: UIViewController? {
        return navigationController.viewControllers.first
    }
    
    public var hasRootController: Bool {
        return rootViewController != nil
    }
    
    public init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
        self.completions = [:]
        super.init()
        self.navigationController.delegate = self
    }
    
    func present(_ module: Presentable) {
        present(module, animated: true)
    }
    
    func present(_ module: Presentable, animated: Bool) {
        navigationController.present(module.toPresent(), animated: animated, completion: nil)
    }
    
    func dismissModule() {
        dismissModule(animated: true, completion: nil)
    }
    
    func dismissModule(animated: Bool, completion: RouterCompletion?) {
        navigationController.dismiss(animated: animated, completion: completion)
    }
    
    func push(_ module: Presentable)  {
        push(module, animated: true)
    }
    
    func push(_ module: Presentable, hideBottomBar: Bool)  {
        push(module, animated: true, hideBottomBar: hideBottomBar, completion: nil)
    }
    
    func push(_ module: Presentable, animated: Bool)  {
        push(module, animated: animated, completion: nil)
    }
    
    func push(_ module: Presentable, animated: Bool, completion: RouterCompletion?) {
        push(module, animated: animated, hideBottomBar: false, completion: completion)
    }
    
    func push(_ module: Presentable, animated: Bool, hideBottomBar: Bool, completion: RouterCompletion?) {
        let controller = module.toPresent()
        guard controller is UINavigationController == false else {
            assertionFailure("Deprecated push UINavigationController.")
            return
        }
        
        if let completion = completion {
            completions[controller] = completion
        }
        
        controller.hidesBottomBarWhenPushed = hideBottomBar
        navigationController.pushViewController(controller, animated: animated)
    }
    
    func popModule() {
        popModule(animated: true)
    }
    
    func popModule(animated: Bool)  {
        if let controller = navigationController.popViewController(animated: animated) {
            runCompletion(for: controller)
        }
    }
    
    func setRootModule(_ module: Presentable) {
        setRootModule(module, hideBar: false)
    }
    
    func setRootModule(_ module: Presentable, hideBar: Bool) {
        completions.forEach { $0.value() }
        navigationController.setViewControllers([module.toPresent()], animated: false)
        navigationController.isNavigationBarHidden = hideBar
    }
    
    func popToRootModule(animated: Bool) {
        if let controllers = navigationController.popToRootViewController(animated: animated) {
            controllers.forEach { runCompletion(for: $0) }
        }
    }
    
    private func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else { return }
        completion()
        completions.removeValue(forKey: controller)
    }
    
    // MARK: Presentable
    public func toPresent() -> UIViewController {
        return navigationController
    }
}

// MARK: UINavigationController Delegate
extension Router: UINavigationControllerDelegate {
    public func navigationController(_ navigationController: UINavigationController,
                                     didShow viewController: UIViewController, animated: Bool) {
        
        guard let poppedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
            !navigationController.viewControllers.contains(poppedViewController) else {
                return
        }
        
        runCompletion(for: poppedViewController)
    }
}
