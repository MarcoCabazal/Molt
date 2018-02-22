Molt
====

Molt is a simple VIPER module generator for Swift apps. 

[![Gem Version](https://badge.fury.io/rb/molt.svg)](https://badge.fury.io/rb/molt) [![Build Status](https://travis-ci.org/MarcoCabazal/Molt.svg?branch=development)](https://travis-ci.org/MarcoCabazal/Molt) [![CircleCI](https://circleci.com/gh/MarcoCabazal/Molt.svg?style=svg)](https://circleci.com/gh/MarcoCabazal/Molt)

### Table of Contents
1. [Installation](#installation)
2. [Global Configuration](#global-configuration)
3. [Per-Project Configuration](#per-project-configuration)
4. [Template Sets](#template-sets)
5. [Creating (generating) a module](#creation)
6. [Additional options/overrides when generating modules](#options)
7. [Exporting template sets as Xcode templates](#xcode)
8. [Notes about the bundled `VIPER_TableView` template set](#notes)
9. [TODOs](#todos)
10. [Contributing](#contributing)
11. [License](#license)
12. [Code of Conduct](#coc)


## Installation <a name="installation"></a>

    $ gem install molt

## Global Configuration <a name="global-configuration"></a>

To initialize global configuration in `~/.molt`:

    $ molt setup
    create  ~/.molt
    create  ~/.molt/models/Entity+CoreData.swift.liquid
    create  ~/.molt/models/Entity.swift.liquid
    create  ~/.molt/models/Model.swift.liquid
    create  ~/.molt/partials/_header.liquid
    create  ~/.molt/swift_helpers/ErrorTypes/APIError.swift
    create  ~/.molt/swift_helpers/ErrorTypes/ErrorTypes.swift
    create  ~/.molt/swift_helpers/ErrorTypes/PersistenceError.swift
    create  ~/.molt/swift_helpers/ISODateTransform.swift
    create  ~/.molt/swift_helpers/Identifiable.swift
    create  ~/.molt/swift_helpers/Loadable.swift
    create  ~/.molt/swift_helpers/Networking/APIRouter.swift
    create  ~/.molt/swift_helpers/StoryboardExtensions.swift
    create  ~/.molt/template_sets/VIPER_Detail/Presenter.swift.liquid
    create  ~/.molt/template_sets/VIPER_Detail/Protocols.swift.liquid
    create  ~/.molt/template_sets/VIPER_Detail/View.swift.liquid
    create  ~/.molt/template_sets/VIPER_Detail/Wireframe.swift.liquid
    create  ~/.molt/template_sets/VIPER_TableView/DataManagers/LocalDataManager.swift.liquid
    create  ~/.molt/template_sets/VIPER_TableView/DataManagers/RemoteDataManager.swift.liquid
    create  ~/.molt/template_sets/VIPER_TableView/Interactor.swift.liquid
    create  ~/.molt/template_sets/VIPER_TableView/Presenter.swift.liquid
    create  ~/.molt/template_sets/VIPER_TableView/Protocols.swift.liquid
    create  ~/.molt/template_sets/VIPER_TableView/View.swift.liquid
    create  ~/.molt/template_sets/VIPER_TableView/Wireframe.swift.liquid
    create  ~/.molt/config.yml

    This will create the folder `~/.molt`, copy bundled template sets and helper Swift extensions onto it. 

This will also create a base config file (`config.yml`). If you have a global git config at `~/.gitconfig`, some of the developer details would already be filled out for you. The details you put here would be used to populate meta data in the header files of the generated source code.

You should customize this with your information before you proceed with generating new modules.

    developer:
      name: Tom Hagen
      email: tom@omerta.org
      company: Genco Olive Oil Imports

    project:
      name: CapoRegime

## Per-Project Configuration <a name="per-project-configuration"></a>

On the other hand, to setup per-project configuration, go to your project's root folder, then:

    $ molt setup:project
    create  .molt
    create  .molt/models/Entity+CoreData.swift.liquid
    create  .molt/models/Entity.swift.liquid
    create  .molt/models/Model.swift.liquid
    create  .molt/partials/_header.liquid
    create  .molt/swift_helpers/ErrorTypes/APIError.swift
    create  .molt/swift_helpers/ErrorTypes/ErrorTypes.swift
    create  .molt/swift_helpers/ErrorTypes/PersistenceError.swift
    create  .molt/swift_helpers/ISODateTransform.swift
    create  .molt/swift_helpers/Identifiable.swift
    create  .molt/swift_helpers/Loadable.swift
    create  .molt/swift_helpers/Networking/APIRouter.swift
    create  .molt/swift_helpers/StoryboardExtensions.swift
    create  .molt/template_sets/VIPER_Detail/Presenter.swift.liquid
    create  .molt/template_sets/VIPER_Detail/Protocols.swift.liquid
    create  .molt/template_sets/VIPER_Detail/View.swift.liquid
    create  .molt/template_sets/VIPER_Detail/Wireframe.swift.liquid
    create  .molt/template_sets/VIPER_TableView/DataManagers/LocalDataManager.swift.liquid
    create  .molt/template_sets/VIPER_TableView/DataManagers/RemoteDataManager.swift.liquid
    create  .molt/template_sets/VIPER_TableView/Interactor.swift.liquid
    create  .molt/template_sets/VIPER_TableView/Presenter.swift.liquid
    create  .molt/template_sets/VIPER_TableView/Protocols.swift.liquid
    create  .molt/template_sets/VIPER_TableView/View.swift.liquid
    create  .molt/template_sets/VIPER_TableView/Wireframe.swift.liquid
    create  .molt/config.yml


## Template Sets <a name="template-sets"></a>

Template sets are groups of [Liquid](https://shopify.github.io/liquid/) template files which make up a VIPER module. This gem comes with two sample sets that can be used to generate a module for use with a `UITableView` (`VIPER_TableView`) and a detail screen (`VIPER_Detail`). These should serve as good starting points for your own customizations. Just duplicate the respective folders under `~/.molt/template_sets`, then customize to suit your taste. 

The template system makes use of `Liquid` and supports partials which are located in `.molt/partials`.

To list available template sets (search order: current project directory, global, bundled):

    $ molt template_sets
    ./.molt:
    ./.molt/template_sets/VIPER_TableView
    ./.molt/template_sets/some_project_specific_template

    ~/.molt:
    ~/.molt/template_sets/VIPER_TableView
    ~/.molt/template_sets/VIPER_Detail

    Add --verbose to list all files in each template set


To list available template sets and the template files they contain:

    $ molt template_sets --verbose
    ./.molt:
    ./.molt/models/Entity+CoreData.swift.liquid
    ./.molt/models/Model.swift.liquid
    ./.molt/models/Entity.swift.liquid
    ./.molt/template_sets/VIPER_TableView/Protocols.swift.liquid
    ./.molt/template_sets/VIPER_TableView/Presenter.swift.liquid
    ./.molt/template_sets/VIPER_TableView/DataManagers/RemoteDataManager.swift.liquid
    ./.molt/template_sets/VIPER_TableView/DataManagers/LocalDataManager.swift.liquid
    ./.molt/template_sets/VIPER_TableView/View.swift.liquid
    ./.molt/template_sets/VIPER_TableView/Wireframe.swift.liquid
    ./.molt/template_sets/VIPER_TableView/Interactor.swift.liquid
    ./.molt/template_sets/some_project_specific_template/Protocols.swift.liquid
    ./.molt/template_sets/some_project_specific_template/Presenter.swift.liquid
    ./.molt/template_sets/some_project_specific_template/View.swift.liquid
    ./.molt/template_sets/some_project_specific_template/Wireframe.swift.liquid

    ~/.molt:
    ~/.molt/models/Entity+CoreData.swift.liquid
    ~/.molt/models/Model.swift.liquid
    ~/.molt/models/Entity.swift.liquid
    ~/.molt/template_sets/VIPER_TableView/Protocols.swift.liquid
    ~/.molt/template_sets/VIPER_TableView/Presenter.swift.liquid
    ~/.molt/template_sets/VIPER_TableView/DataManagers/RemoteDataManager.swift.liquid
    ~/.molt/template_sets/VIPER_TableView/DataManagers/LocalDataManager.swift.liquid
    ~/.molt/template_sets/VIPER_TableView/View.swift.liquid
    ~/.molt/template_sets/VIPER_TableView/Wireframe.swift.liquid
    ~/.molt/template_sets/VIPER_TableView/Interactor.swift.liquid
    ~/.molt/template_sets/VIPER_Detail/Protocols.swift.liquid
    ~/.molt/template_sets/VIPER_Detail/Presenter.swift.liquid
    ~/.molt/template_sets/VIPER_Detail/View.swift.liquid
    ~/.molt/template_sets/VIPER_Detail/Wireframe.swift.liquid

## Creating (generating) a module <a name="creation"></a>

    $ molt create_module Friends VIPER_TableView
    +-------------------------------------------------------------+-------------------------------------------------------+
    | Developer                                                   | Tom Hagen                                             |
    | Email                                                       | tom@omerta.org                                        |
    | Company                                                     | Genco Olive Oil Imports                               |
    | Project                                                     | CapoRegime                                            |
    |                                                             |                                                       |
    | Template Set                                                | VIPER_TableView                                       |
    |                                                             |                                                       |
    | Source                                                      | Destination                                           |
    | VIPER_TableView/Protocols.swift.liquid                      | ./Friends/FriendsProtocols.swift                      |
    | VIPER_TableView/Presenter.swift.liquid                      | ./Friends/FriendsPresenter.swift                      |
    | VIPER_TableView/DataManagers/RemoteDataManager.swift.liquid | ./Friends/DataManagers/FriendsRemoteDataManager.swift |
    | VIPER_TableView/DataManagers/LocalDataManager.swift.liquid  | ./Friends/DataManagers/FriendsLocalDataManager.swift  |
    | VIPER_TableView/View.swift.liquid                           | ./Friends/FriendsView.swift                           |
    | VIPER_TableView/Wireframe.swift.liquid                      | ./Friends/FriendsWireframe.swift                      |
    | VIPER_TableView/Interactor.swift.liquid                     | ./Friends/FriendsInteractor.swift                     |
    +-------------------------------------------------------------+-------------------------------------------------------+

    That was just a dry-run. If this looks good to you, don't forget to add --do-it

Note that generating a new module will never touch your Xcode project, but it's just a matter of dragging the resulting folder onto Xcode. 

## Additional options/overrides when generating modules <a name="options"></a>

    $ molt help create_module
    Usage:
      molt create_module MODULE_NAME TEMPLATE_SET

    Options:
        --name NAME                # Author name
        --email EMAIL              # Author email
        -company COMPANY           # Author company
        -project PROJECT           # Project name
        -output-folder DIRECTORY   # Create module folder in this directory. Defaults to "./"
        -model MODEL               # Model name. If unspecified, Xcode placeholders will be used instead
        -create-model              # If specified, it creates corresponding Mappable struct (ObjectMapper) and Core Data entity; requires --model to be set
        -do-it                     # Release the Kraken and write the files

## Exporting template sets as Xcode templates <a name="xcode"></a>

    $ molt xcode VIPER_TableView 
    +-------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------+
    | Template Set                                                | VIPER_TableView                                                                                                              |
    |                                                             |                                                                                                                              |
    | Source                                                      | Destination                                                                                                                  |
    | VIPER_TableView/Protocols.swift.liquid                      | ~/Library/Developer/Xcode/Templates/File Templates/Molt/VIPER TableView.xctemplate/___FILEBASENAME___Protocols.swift         |
    | VIPER_TableView/Presenter.swift.liquid                      | ~/Library/Developer/Xcode/Templates/File Templates/Molt/VIPER TableView.xctemplate/___FILEBASENAME___Presenter.swift         |
    | VIPER_TableView/DataManagers/RemoteDataManager.swift.liquid | ~/Library/Developer/Xcode/Templates/File Templates/Molt/VIPER TableView.xctemplate/___FILEBASENAME___RemoteDataManager.swift |
    | VIPER_TableView/DataManagers/LocalDataManager.swift.liquid  | ~/Library/Developer/Xcode/Templates/File Templates/Molt/VIPER TableView.xctemplate/___FILEBASENAME___LocalDataManager.swift  |
    | VIPER_TableView/View.swift.liquid                           | ~/Library/Developer/Xcode/Templates/File Templates/Molt/VIPER TableView.xctemplate/___FILEBASENAME___View.swift              |
    | VIPER_TableView/Wireframe.swift.liquid                      | ~/Library/Developer/Xcode/Templates/File Templates/Molt/VIPER TableView.xctemplate/___FILEBASENAME___Wireframe.swift         |
    | VIPER_TableView/Interactor.swift.liquid                     | ~/Library/Developer/Xcode/Templates/File Templates/Molt/VIPER TableView.xctemplate/___FILEBASENAME___Interactor.swift        |
    +-------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------+

This command basically exports a template set and makes it available as an Xcode template, which makes your often-used template instantly available from within Xcode itself. When you do create a new file from within Xcode, you will be prompted for the module name and the model. Other meta details normally available in `create_module` won't be necessary during the export.

## Notes about the bundled `VIPER_TableView` template set <a name="notes"></a>

1. The `RemoteDataManager` makes use of `Alamofire` and `ObjectMapper`
2. The `LocalDataManager` makes use of `Core Data`
3. The `Interactor` and `RemoteDataManager` talks to each other using promises via `Hydra`
3. You'll notice there aren't any mention of segues here, but Storyboards and Scenes are in. 
4. The template makes use of some Swift extensions, all of which are made available in `.molt/swift_helpers`

To appreciate, please see the sample rendered source code for [Friends](https://github.com/MarcoCabazal/Molt/tree/development/sample_output).

### TODOs <a name="todos"></a>

1. Demo a working app done created using generators
1. Write more comprehensive tests

### Contributing <a name="contributing"></a>

Bug reports and pull requests are welcome on GitHub at https://github.com/MarcoCabazal/molt. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

### License <a name="license"></a>

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

### Code of Conduct <a name="coc"></a>

Everyone interacting in the Molt project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/darthmarku/molt/blob/master/CODE_OF_CONDUCT.md).
