//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import UIKit
import JGProgressHUD

class HUDHolder {
    static let shared: HUDHolder = HUDHolder()
    
    private var hudStack: [UIViewController: JGProgressHUD] = [:]
    
    func add(hud: JGProgressHUD, controller: UIViewController) {
        hudStack[controller] = hud
    }
    
    func dismissCurrent(_ viewController: UIViewController) {
        let hud = hudStack[viewController]
        hud?.dismiss()
        hudStack.removeValue(forKey: viewController)
    }
    
    func dismissAll() {
        hudStack.forEach({$0.value.dismiss()})
    }
}


protocol HUDRoutable: Presentable, BaseModuleRoutable {
    
}

extension HUDRoutable {
    func showProgress() {
        let view = self.coordinator.router.navigationController
        let progressHUD = JGProgressHUD(style: .dark)
        progressHUD.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        progressHUD.animation = JGProgressHUDFadeZoomAnimation()
        progressHUD.show(in: view.view)
        HUDHolder.shared.add(hud: progressHUD, controller: view)
    }
    
    func showNotification(_ message: String) {
        let view = self.coordinator.router.navigationController
        let progressHUD = JGProgressHUD(style: .dark)
        progressHUD.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        progressHUD.animation = JGProgressHUDFadeZoomAnimation()
        progressHUD.textLabel.text = message
        progressHUD.show(in: view.view)
        
        HUDHolder.shared.add(hud: progressHUD, controller: view)
    }
    
    func dismissHUD() {
        let view = self.coordinator.router.navigationController
        HUDHolder.shared.dismissCurrent(view)
    }
    
    func dismissAll() {
        HUDHolder.shared.dismissAll()
    }
}
