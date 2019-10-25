![Core-iOS-Application-Architecture](/images/header.png)

## Overview

MVP and MVC modules template has been deprecated!

Core iOS Application Architecture - The development paradigm of clean, testable code and modular iOS applications.

This repository contains Xcode templates for quickly creating a project, modules, services and coordinator.


![Core-Architecture](/images/core.png)

## Contents

* [Requirements](#requirements)
  + [Example project](#example-project)
* [Usage](#usage)
  + [Project structure](#project-structure)
  + [Project Template](#project-template)
  + [Module Template](#module-template)
  + [Service Template](#service-template-soa)
  + [Coordinator Template](#coordinator-template)
* [Code Style](#code-style)
  + [Naming](#naming)
* [Installation](#installation)
* [Author](#author)
* [License](#license)


## Requirements

* Xcode 10+
* Swift 4.2+

### Example project

[Download](https://github.com/bartleby/CAA-Exemple-Project) example project built on the basis of this paradigm.


## Usage

#### Create new Project

* Open Xcode
* File > New > Project or press shortcuts ⇧⌘N
* Choice MVC, MVP or VIPER Architecture
* After you have created a project, you need to remove reference on the folder "Classes"
  - Highlight the Classes folder in the Xcode Project Navigator
  - Press Backspace Key
  - Press "Remove Reference" in alert window
* Now you need to return the "Classes" folder to the project.
  - Drag the "Classes" folder from the Finder to the Xcode project
* Profit! 🎉

#### Create new Module, Service or Coordinator

* Open Xcode Project
* Select Modules, Services or Coordinators Group in Xcode Project Navigator
* Create new file
  - File > New > File... or press shortcuts ⌘N
  - Choice Module (MVC, MVP or VIPER) Service or Coordinator
  - Enter Name (if you wont to create "Service" you must specify at the end of the name "Service" for example - NetworkService or SettingsService)
* After you have created a Service, Module or Coordinator, you need to remove reference on the folder
  - Highlight the Folder in the Xcode Project Navigator
  - Press Backspace Key
  - Press "Remove Reference" in alert window
* Now you need to return your Folder to the project.
  - Drag the Folder from the Finder to the Xcode project
* Profit! 🎉

Important! you need to add your Service, Module or Coordinator to the DI Container in AppDelegate.swift

```Swift
// Setup Coordinators
container.apply(AppCoordinatorAssembly.self)
container.apply(MainCoordinatorAssembly.self)
// add your coordinator here

// Setup Modules
container.apply(MainAssembly.self)
// add your module here

// Setup Services
container.apply(AppConfigServiceAssembly.self)
container.apply(EnvironmentServiceAssembly.self)
// add your service here
```

### Project Template

<img src="/images/project-viper.png" align="left" height="80px">
<img src="/images/project-mvp.png" align="left" height="80px">
<img src="/images/project-mvc.png" align="left" height="80px">

<br>
<br>
<br>
<br>

There are 3 project templates, MVC, MVP and VIPER, the templates differ only in the main module architecture.
This does not affect the continued use of modules, you can create any modules based on the complexity of your screen.
For example, you plan a small project, then your choice is a project based on the MVP pattern.

#### Each project template includes:
- DeepLink out of the box
- Launch Instructor
- Plugable AppDelegate
- [Swilby](https://github.com/bartleby/Swilby) Library for DI
- Toolkit, Tweaks
- Extensions
- Router
- etc.

### Project structure

* AppDelegate
  - Services
* Assemblys
  - Coordinators
  - Modules
  - Services
* Constants
* Library
  - Swilby
* Utils
  - Tweaks
* Extensions
  - Collection
  - Numbers
  - Codable
  - Color
  - Date
  - URL
  - FileManager
  - View
  - String
  - NSObject
* Common
  - AppDelegateManager
  - Coordinator
  - Module
  - ActionCloud
  - View
  - Protocols
  - DeepLink
  - Router



### Module Template

<img src="/images/module-viper.png" align="left" height="80px" hspace="0px" vspace="10px">
<img src="/images/module-mvp.png" align="left" height="80px" hspace="0px" vspace="10px">
<img src="/images/module-mvc.png" align="left" height="80px" hspace="0px" vspace="10px">

<br>
<br>
<br>
<br>

You can use different modules in one project based on the complexity of your screen.
One screen - one module.
For example, you need to create a simple screen on which there will be a WebView with some information - your choice of MVC module,
If the screen assumes complex business logic, interaction with the server, etc., your choice is the VIPER module.

All your modules should be in the "Modules" folder along the path "Classes/Assemblys/Modules"

#### VIPER Module structure

* Module
  - Storyboards
  - Assembly
  - Presenter
  - Interactor
  - View
  - Protocols

#### MVP Module structure

* Module
  - Storyboards
  - Assembly
  - Presenter
  - View
  - Protocols

#### MVC Module structure

* Module
  - Storyboards
  - Assembly
  - View
  - Protocols

### Service Template (SoA)

<img src="/images/service.png" align="left" height="80px" hspace="0px" vspace="10px">

<br>
<br>
<br>
<br>

Each service is engaged in its own business: the authorization service works with authorization, the user service with user data and so on. A good rule (a specific service works with one type of entity) is separation from the server side into different path: /auth, /user, /settings, but this is not necessary.

All your services should be in the "Services" folder along the path "Classes/Assemblys/Services"

You can learn more about the principle of developing SoA from [wikipedia](https://en.wikipedia.org/wiki/Service-oriented_architecture)


### Coordinator Template

<img src="/images/coordinator.png" align="left" height="80px" hspace="0px" vspace="10px">

<br>
<br>
<br>
<br>

Coordinator is an object that handles navigation flow and shares flow’s handling for the next coordinator after switching on the next chain. It means that coordinators should only keep navigation logic between screens. Coordinators can keep references to a storage, which holds data that is used by factories for creating modules, but they can never handle a module’s business logic and never drive a cell’s behavior.

All your coordinators should be in the "Coordinators" folder along the path "Classes/Assemblys/Coordinators"

You can learn more about the coordinators from the [article](https://medium.com/blacklane-engineering/coordinators-essential-tutorial-part-i-376c836e9ba7) by Andrey Panov.


## Code Style

### Naming

Good clean code also depends on the correct naming.

###### Wrong!
```Swift
@IBOutlet weak var descriptionText: UITextView!
@IBOutlet weak var image: UIImageView!
@IBOutlet weak var avatarIcon: UIImageView!
@IBOutlet weak var labelTitle: UILabel!
@IBOutlet weak var contentView: UIScrollView!

```

###### Right!
```Swift

@IBOutlet weak var descriptionTextView: UITextView!
@IBOutlet weak var avatarImageView: UIImageView!
@IBOutlet weak var titleLabel: UILabel!
@IBOutlet weak var contentScrollView: UIScrollView!

```

###### Wrong!
```Swift

let vc = NewsViewController()
let msg = Message()
let shape1 = Shape()

```

###### Right!
```Swift

let newsViewController = NewsViewController()
let message = Message()
let square = Shape()

```

###### Wrong!
```Swift

view.hidden
element.expanded
array.empty

```

###### Right!
```Swift

view.isHidden
element.isExpanded
array.isEmpty

```

#### View Output

###### Wrong!
```Swift
func viewLoaded()
func authButtonTap()
func textChanged(text: String)

```

###### Right!
```Swift

func viewDidLoad()
func authButtonDidTap()
func usernameTextFieldDidChange(value: String)

```

#### Module Output

###### Wrong!
```Swift

var authCancel: (() -> Void)? { get set }
var authComplete: ((String) -> Void)? { get set }
var userData: ((UserData) -> Void)? { get set }

```

###### Right!
```Swift

var onAuthCanceled: (() -> Void)? { get set }
var onAuthCompleted: ((String) -> Void)? { get set }
var onUserDataCompleted: ((UserData) -> Void)? { get set }

```

#### Module Input

###### Wrong!
```Swift

func token(_ token: String)
func pageIndex(_ i: Int)

```

###### Right!
```Swift

func set(token: String)
func setPage(index: Int)

```

#### Interactor Input

###### Wrong!
```Swift

func getUser(_ completion: (User) -> Void)
func obtainUser(_ completion: (User) -> ())
func config() -> Config

```

###### Right!

```Swift

func obtainUser(_ completion: (User) -> Void)
func obtainConfig(_ completion: (Config) -> Void)

```


## Installation

Only need execute this command in terminal:

```swift
sudo swift install.swift
```

## Author

🦆 Alex Artemev [www.iDevs.io](https://iDevs.io)


## License

MIT License

Copyright (c) 2019 Alex Artemev (iDevs.io)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
