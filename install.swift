//
//  main.swift
//  Core-iOS-Application-Architecture
//
//  Created by Alexey Artemev on 29/03/2019
//  Copyright © 2019 iDevs. All rights reserved.
//

import Foundation

func printInConsole(_ message:Any){
    print("==> \(message)")
}

let fileManager = FileManager.default
let homeDirectoryForCurrentUser = fileManager.homeDirectoryForCurrentUser.path
let currentPath = fileManager.currentDirectoryPath
let templatePath = "\(homeDirectoryForCurrentUser)/Library/Developer/Xcode/Templates/"

let projectDir = "Project Templates/"
let moduleDir = "File Templates/"

let sourceProjectPath = "\(currentPath)/\(projectDir)"
let sourceModulePath = "\(currentPath)/\(moduleDir)"

let projectTemplatePath = "\(templatePath)/\(projectDir)"
let moduleTemplatePath = "\(templatePath)/\(moduleDir)"

func makeDir(path: String) {
    try? fileManager.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
}

func moveTemplate(fromPath: String, toPath: String) throws {
    let toURL = URL(fileURLWithPath:toPath)
    try _ = fileManager.removeItem(at: toURL)
    try _ = fileManager.copyItem(atPath: fromPath, toPath: toPath)
}


do {
    printInConsole("Install Project templates at \(projectTemplatePath)")
    makeDir(path: projectTemplatePath)
    try moveTemplate(fromPath: sourceProjectPath, toPath: projectTemplatePath)

    printInConsole("Install Module templates at \(moduleTemplatePath)")
    makeDir(path: moduleTemplatePath)
    try moveTemplate(fromPath: sourceModulePath, toPath: moduleTemplatePath)
    
    printInConsole("All templates have been successfully installed.")
} catch let error as NSError {
    printInConsole("Could not install the templates. Reason: \(error.localizedFailureReason ?? "")")
}
