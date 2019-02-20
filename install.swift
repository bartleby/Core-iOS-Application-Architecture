//
//  main.swift
//  InstallVIPERTemplate
//
//  Created by Juanpe Catalán on 17/02/2017.
//  Copyright © 2017 Juanpe Catalán. All rights reserved.
//

import Foundation

func printInConsole(_ message:Any){
    print("==> \(message)")
}

let fileManager = FileManager.default
let homeDirectoryForCurrentUser = fileManager.homeDirectoryForCurrentUser.path
let currentPath = fileManager.currentDirectoryPath
let templatePath = "\(homeDirectoryForCurrentUser)/Library/Developer/Xcode/Templates/"

let projectDir = "Project Templates/iOS/iDevs.io"
let moduleDir = "File Templates/iDevs.io"

let sourceProjectPath = "\(currentPath)/\(projectDir)"
let sourceModulePath = "\(currentPath)/\(moduleDir)"

let projectTemplatePath = "\(templatePath)/\(projectDir)"
let moduleTemplatePath = "\(templatePath)/\(moduleDir)"

func moveTemplate(fromPath: String, toPath: String){
    let toURL = URL(fileURLWithPath:toPath)

    do {
        if !fileManager.fileExists(atPath: toPath){
            try fileManager.copyItem(atPath: fromPath, toPath: toPath)
            printInConsole("Template installed succesfully.")

        } else {
            try _ = fileManager.removeItem(at: toURL)
            try _ = fileManager.copyItem(atPath: fromPath, toPath: toPath)
            printInConsole("Template already exists. So has been replaced succesfully.")
        }
    }
    catch let error as NSError {
        printInConsole("Ooops! Something went wrong: \(error.localizedFailureReason!)")
    }
}

printInConsole("Install Project templates...")
moveTemplate(fromPath: sourceProjectPath, toPath: projectTemplatePath)

printInConsole("Install Module templates...")
moveTemplate(fromPath: sourceModulePath, toPath: moduleTemplatePath)

printInConsole("All templates have been successfully installed.")
