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

Вы можете использовать разные модули в одном проекте исходя из сложности вашего экрана.
Один экран - один модуль.
Например вам нужно создать простой экран на котором будет WebView с какой то информацией, Ваш выбор MVC модуль,
если экран предпологает сложную бизнес логику, взаимодействие с сервером и т.д - ваш выбор модуль VIPER.

### VIPER Module structure

* Module
  - Storyboards
  - Assembly
  - Presenter
  - Interactor
  - View
  - Protocols

### MVP Module structure

* Module
  - Storyboards
  - Assembly
  - Presenter
  - View
  - Protocols

### MVC Module structure

* Module
  - Storyboards
  - Assembly
  - View
  - Protocols

### Service Template

<img src="/images/service.png" align="left" height="80px" hspace="0px" vspace="10px">

<br>
<br>
<br>
<br>

Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.


### Coordinator Template

<img src="/images/coordinator.png" align="left" height="80px" hspace="0px" vspace="10px">

<br>
<br>
<br>
<br>

Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.


## Code Style

### Naming

#### View
#### Presenter
#### Interactor
#### Module


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
