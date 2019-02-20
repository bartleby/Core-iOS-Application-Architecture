//
//  Module.swift
//  HHGGHH
//
//  Created by bart on 17/02/2019.
//  Copyright © 2019 idevs. All rights reserved.
//

import UIKit

struct Module<Input, Output>: Presentable {
    var view: UIViewController
    var input: Input
    var output: Output
    
    func toPresent() -> UIViewController {
        return view
    }
}
