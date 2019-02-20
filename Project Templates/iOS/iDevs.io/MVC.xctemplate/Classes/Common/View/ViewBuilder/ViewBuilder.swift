//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import UIKit

protocol ViewConfiguratorType: class {
    var key: String {get set}
    var isCachable: Bool {get set}
    func configureView(_ data: Any) -> UIViewController
}

class ViewConfigurator<T>: ViewConfiguratorType {
    typealias ConfigureBlock = (T) -> UIViewController
    
    var key: String
    var isCachable: Bool
    let configure: ConfigureBlock
    
    init(key: String, cacheble: Bool = true, configure: @escaping ConfigureBlock) {
        self.key = key
        self.isCachable = cacheble
        self.configure = configure
    }
    
    func configureView(_ data: Any) -> UIViewController {
        if let data = data as? T {
            return configure(data)
        } else {
            fatalError("invalid data type")
        }
    }
}

class ViewBuilder {
    var items = [String : ViewConfiguratorType]()
    var cache = [String : ContainerView]()
    
    func register<T>(_ configurator: ViewConfigurator<T>) {
        items[configurator.key] = configurator
    }
    
    func build<T>(forKey key: String, data: T) -> ContainerView? {
        guard let configure = items[key] else { return nil }
        var result: ContainerView?
        
        if let view = cache[key] {
            result = view
        } else {
            let controller = configure.configureView(data)
            let container = ContainerView()
            container.embedViewController(controller)
            if configure.isCachable {
                cache[key] = container
            }
            result = container
        }
        
        return result
    }
}
