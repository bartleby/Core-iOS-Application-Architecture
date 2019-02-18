![Core-iOS-Application-Architecture](/images/header.png)

## Overview

Core iOS Application Architecture - The development paradigm of clean, testable code, modular iOS applications.

![Core-Architecture](/images/core.png)

## Contents

* [Requirements](#requirements)
* [Usage](#usage)
  + [Project structure](#project-structure)
  + [Project Template](#project-template)
  + [Module Template](#module-template)
  + [Service Template](#service-template)
  + [Coordinator Template](#coordinator-template)
* [Code Style](#code-style)
  + [Naming](#naming)
    - [View](#view)
    - [Presenter](#presenter)
    - [Interactor](#interactor)
    - [Module](#module)
* [Installation](#installation)
* [License](#license)


## Requirements

* Xcode 10+
* Swift 4.2+

### Example project

Download a sample project built on the basis of this paradigm.


## Usage


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
  - Plugins
* Assemblys
  - Coordinators
  - Modules
  - Services
* Config
  - Constants and ConfigDefaults
* Library
  - Swilby
* Utils
  - Tweaks
  - PlugableAppDelegate
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
  - Misc
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

You can learn more about the principle of developing SoA from [wikipedia](https://en.wikipedia.org/wiki/Service-oriented_architecture)


### Coordinator Template

<img src="/images/coordinator.png" align="left" height="80px" hspace="0px" vspace="10px">

<br>
<br>
<br>
<br>

Coordinator is an object that handles navigation flow and shares flow’s handling for the next coordinator after switching on the next chain. It means that coordinators should only keep navigation logic between screens. Coordinators can keep references to a storage, which holds data that is used by factories for creating modules, but they can never handle a module’s business logic and never drive a cell’s behavior.

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

var onAuthCancel: (() -> Void)? { get set }
var onAuthComplete: ((String) -> Void)? { get set }
var onUserDataComplete: ((UserData) -> Void)? { get set }

```

#### Module Input

###### Wrong!
```Swift

func token(_ token: String)
func pageIndex(_ i: Int)

```

###### Right!
```Swift

func setToken()
func setPage(index: Int)

```


## Installation

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
