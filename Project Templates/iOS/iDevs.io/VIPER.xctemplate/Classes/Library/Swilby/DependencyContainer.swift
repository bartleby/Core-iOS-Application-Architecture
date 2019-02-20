//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import Foundation

typealias Container = Resolver
typealias LightContainer = Applyer & Resolver

// Container
protocol Applyer {
    func apply<T: Assembly>(_ type: T.Type, name: String?)
    func apply<T: Assembly>(_ type: T.Type)
}

extension Applyer {
    func apply<T: Assembly>(_ type: T.Type) {
        self.apply(type, name: nil)
    }
}

// Resolver
protocol Resolver: WeakBox, StrongBox {
    func resolve<T: Assembly>(_ type: T.Type, name: String?) -> T
    func resolve<T: Assembly>(_ type: T.Type) -> T
}

extension Resolver {
    func resolve<T>(_ type: T.Type) -> T where T : Assembly {
        return self.resolve(type, name: nil)
    }
}

// DI Container
class DependencyContainer {
    internal var weakBoxHolder = [String : WeakContainer<AnyObject>]()
    internal var strongBoxHolder = [String : AnyObject]()

    let assemblyFactory: AssemblyFactoryProtocol
    
    init(assemblyFactory: AssemblyFactoryProtocol) {
        self.assemblyFactory = assemblyFactory
    }
}

extension DependencyContainer: Resolver {
    func resolve<T>(_ type: T.Type, name: String?) -> T where T : Assembly {
        let module = self.assemblyFactory.resolve(type, name: name)
        return module.init(container: self)
    }
}

extension DependencyContainer: Applyer {
    func apply<T>(_ type: T.Type, name: String?) where T : AssemblyType {
        self.assemblyFactory.apply(type, name: name)
    }
}
