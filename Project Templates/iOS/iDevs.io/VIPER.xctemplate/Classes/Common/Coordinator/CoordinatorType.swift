//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import Foundation

protocol CoordinatorType: AnyObject, Presentable {
    var container: Container {get}
    var router: RouterType {get}
    var dismiss: (() -> Void)? {get set}
    
    func start()
    func start(with option: DeepLinkOption?)
}
