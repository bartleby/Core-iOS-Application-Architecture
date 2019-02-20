//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import UIKit

protocol AlertCoordinable: CoordinatorType, Presentable {
    typealias AlertTextFieldHandler = (UITextField) -> Void
    
    func showAlert(title: String, message: String)
    func showAllert(config: AlertConfiguration, style: UIAlertController.Style)
    func showAlertWithTextField(title: String, message: String, placeholder: String,
                                handler: @escaping AlertTextFieldHandler)
}

struct AlertConfiguration {
    typealias AlertCompletion = () -> Void
    typealias AlertActionHandler = (UIAlertAction) -> Void
    
    var title: String?
    var message: String?
    var actions: [UIAlertAction]
    var completion: AlertCompletion?
    
    init(title: String?, message: String?, completion: AlertCompletion? = nil) {
        self.init(title: title, message: message, actions: [], completion: completion)
    }
    
    init(title: String?, message: String?, actions: [UIAlertAction], completion: AlertCompletion? = nil) {
        self.title = title
        self.message = message
        self.actions = actions
        self.completion = completion
    }
    
    mutating func addAction(title: String?, style: UIAlertAction.Style, actionHandler: AlertActionHandler? = nil) {
        self.actions.append(UIAlertAction(title: title, style: style, handler: actionHandler))
    }
}

extension AlertCoordinable {
    func showAlert(title: String, message: String) {
        let source = toPresent()
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let completeAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(completeAction)
        source.present(alertController, animated: true, completion: nil)
        
    }
    
    func showAlertWithTextField(title: String, message: String, placeholder: String,
                                handler: @escaping AlertTextFieldHandler) {
        
        let source = toPresent()
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = placeholder
        }
        
        let completeAction = UIAlertAction(title: "OK", style: .default, handler: { [weak alertController] (action) -> Void in
            if let textField = alertController?.textFields![0] {
                handler(textField)
            }
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(completeAction)
        alertController.addAction(cancelAction)
        
        source.present(alertController, animated: true, completion: nil)
        
    }
    
    func showAllert(config: AlertConfiguration, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: config.title, message: config.message, preferredStyle: style)
        config.actions.forEach({ (item) in
            alertController.addAction(item)
        })
        let source = toPresent()
        source.present(alertController, animated: true, completion: config.completion)
        
    }
}


