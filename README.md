Molt
====

Molt is a simple VIPER module generator for Swift apps. 

[![Gem Version](https://badge.fury.io/rb/molt.svg)](https://badge.fury.io/rb/molt) [![Build Status](https://travis-ci.org/MarcoCabazal/Molt.svg?branch=development)](https://travis-ci.org/MarcoCabazal/Molt) [![CircleCI](https://circleci.com/gh/MarcoCabazal/Molt.svg?style=svg)](https://circleci.com/gh/MarcoCabazal/Molt)

## Installation

    $ gem install molt

### Global Configuration

To initialize global configuration in `~/.molt`:

    $ molt setup
    create  /Users/TomHagen/.molt
    create  /Users/TomHagen/.molt/models/Entity+CoreData.swift.liquid
    create  /Users/TomHagen/.molt/models/Entity.swift.liquid
    create  /Users/TomHagen/.molt/models/Model.swift.liquid
    create  /Users/TomHagen/.molt/partials/_header.liquid
    create  /Users/TomHagen/.molt/swift_helpers/ErrorTypes/APIError.swift
    create  /Users/TomHagen/.molt/swift_helpers/ErrorTypes/ErrorTypes.swift
    create  /Users/TomHagen/.molt/swift_helpers/ErrorTypes/PersistenceError.swift
    create  /Users/TomHagen/.molt/swift_helpers/ISODateTransform.swift
    create  /Users/TomHagen/.molt/swift_helpers/Identifiable.swift
    create  /Users/TomHagen/.molt/swift_helpers/Loadable.swift
    create  /Users/TomHagen/.molt/swift_helpers/Networking/APIRouter.swift
    create  /Users/TomHagen/.molt/swift_helpers/StoryboardExtensions.swift
    create  /Users/TomHagen/.molt/template_sets/viper_detail/Presenter.swift.liquid
    create  /Users/TomHagen/.molt/template_sets/viper_detail/Protocols.swift.liquid
    create  /Users/TomHagen/.molt/template_sets/viper_detail/View.swift.liquid
    create  /Users/TomHagen/.molt/template_sets/viper_detail/WireFrame.swift.liquid
    create  /Users/TomHagen/.molt/template_sets/viper_table/DataManagers/LocalDataManager.swift.liquid
    create  /Users/TomHagen/.molt/template_sets/viper_table/DataManagers/RemoteDataManager.swift.liquid
    create  /Users/TomHagen/.molt/template_sets/viper_table/Interactor.swift.liquid
    create  /Users/TomHagen/.molt/template_sets/viper_table/Presenter.swift.liquid
    create  /Users/TomHagen/.molt/template_sets/viper_table/Protocols.swift.liquid
    create  /Users/TomHagen/.molt/template_sets/viper_table/View.swift.liquid
    create  /Users/TomHagen/.molt/template_sets/viper_table/WireFrame.swift.liquid
    create  /Users/TomHagen/.molt/config.yml

    This will create the folder `~/.molt`, copy bundled template sets and helper Swift extensions onto it. 

This will also create a base config file (`config.yml`). If you have a global git config at `~/.gitconfig`, some of the developer details would already be filled out for you. The details you put here would be used to populate meta data in the header files of the generated source code.

You should customize this with your information before you proceed with generating new modules.

    developer:
      name: Tom Hagen
      email: tom@omerta.org
      company: Genco Olive Oil Imports

    project:
      name: CapoRegime

### Per-Project Configuration

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
    create  .molt/template_sets/viper_detail/Presenter.swift.liquid
    create  .molt/template_sets/viper_detail/Protocols.swift.liquid
    create  .molt/template_sets/viper_detail/View.swift.liquid
    create  .molt/template_sets/viper_detail/WireFrame.swift.liquid
    create  .molt/template_sets/viper_table/DataManagers/LocalDataManager.swift.liquid
    create  .molt/template_sets/viper_table/DataManagers/RemoteDataManager.swift.liquid
    create  .molt/template_sets/viper_table/Interactor.swift.liquid
    create  .molt/template_sets/viper_table/Presenter.swift.liquid
    create  .molt/template_sets/viper_table/Protocols.swift.liquid
    create  .molt/template_sets/viper_table/View.swift.liquid
    create  .molt/template_sets/viper_table/WireFrame.swift.liquid
    create  .molt/config.yml


### Template Sets

Template sets are groups of [Liquid](https://shopify.github.io/liquid/) template files which make up a VIPER module. This gem comes with two sample sets that can be used to generate a module for use with a `UITableView` (`viper_table`) and a detail screen (`viper_detail`). These should serve as good starting points for your own customizations. Just duplicate the respective folders under `~/.molt/template_sets`, then customize to suit your taste. 

The template system makes use of `Liquid` and supports partials which are located in `.molt/partials`.

To list available template sets (search order: current project directory, global, bundled):

    $ molt template_sets
    ./.molt:
    ./.molt/template_sets/viper_table
    ./.molt/template_sets/some_project_specific_template

    /Users/TomHagen/.molt:
    /Users/TomHagen/.molt/template_sets/viper_table
    /Users/TomHagen/.molt/template_sets/viper_detail

    Add --verbose to list all files in each template set


To list available template sets and the template files they contain:

    $ molt template_sets --verbose
    ./.molt:
    ./.molt/models/Entity+CoreData.swift.liquid
    ./.molt/models/Model.swift.liquid
    ./.molt/models/Entity.swift.liquid
    ./.molt/template_sets/viper_table/Protocols.swift.liquid
    ./.molt/template_sets/viper_table/Presenter.swift.liquid
    ./.molt/template_sets/viper_table/DataManagers/RemoteDataManager.swift.liquid
    ./.molt/template_sets/viper_table/DataManagers/LocalDataManager.swift.liquid
    ./.molt/template_sets/viper_table/View.swift.liquid
    ./.molt/template_sets/viper_table/WireFrame.swift.liquid
    ./.molt/template_sets/viper_table/Interactor.swift.liquid
    ./.molt/template_sets/some_project_specific_template/Protocols.swift.liquid
    ./.molt/template_sets/some_project_specific_template/Presenter.swift.liquid
    ./.molt/template_sets/some_project_specific_template/View.swift.liquid
    ./.molt/template_sets/some_project_specific_template/WireFrame.swift.liquid

    /Users/TomHagen/.molt:
    /Users/TomHagen/.molt/models/Entity+CoreData.swift.liquid
    /Users/TomHagen/.molt/models/Model.swift.liquid
    /Users/TomHagen/.molt/models/Entity.swift.liquid
    /Users/TomHagen/.molt/template_sets/viper_table/Protocols.swift.liquid
    /Users/TomHagen/.molt/template_sets/viper_table/Presenter.swift.liquid
    /Users/TomHagen/.molt/template_sets/viper_table/DataManagers/RemoteDataManager.swift.liquid
    /Users/TomHagen/.molt/template_sets/viper_table/DataManagers/LocalDataManager.swift.liquid
    /Users/TomHagen/.molt/template_sets/viper_table/View.swift.liquid
    /Users/TomHagen/.molt/template_sets/viper_table/WireFrame.swift.liquid
    /Users/TomHagen/.molt/template_sets/viper_table/Interactor.swift.liquid
    /Users/TomHagen/.molt/template_sets/viper_detail/Protocols.swift.liquid
    /Users/TomHagen/.molt/template_sets/viper_detail/Presenter.swift.liquid
    /Users/TomHagen/.molt/template_sets/viper_detail/View.swift.liquid
    /Users/TomHagen/.molt/template_sets/viper_detail/WireFrame.swift.liquid

### Creating (generating) a module

    $ molt create_module Friends viper_table
    +---------------------------------------------------------+-------------------------------------------------------+
    | Developer                                               | Tom Hagen                                             |
    | Email                                                   | tom@omerta.org                                        |
    | Company                                                 | Genco Olive Oil Imports                               |
    | Project                                                 | CapoRegime                                            |
    |                                                         |                                                       |
    | Template Set                                            | viper_table                                           |
    |                                                         |                                                       |
    | Source                                                  | Destination                                           |
    | viper_table/Protocols.swift.liquid                      | ./Friends/FriendsProtocols.swift                      |
    | viper_table/Presenter.swift.liquid                      | ./Friends/FriendsPresenter.swift                      |
    | viper_table/DataManagers/RemoteDataManager.swift.liquid | ./Friends/DataManagers/FriendsRemoteDataManager.swift |
    | viper_table/DataManagers/LocalDataManager.swift.liquid  | ./Friends/DataManagers/FriendsLocalDataManager.swift  |
    | viper_table/View.swift.liquid                           | ./Friends/FriendsView.swift                           |
    | viper_table/WireFrame.swift.liquid                      | ./Friends/FriendsWireFrame.swift                      |
    | viper_table/Interactor.swift.liquid                     | ./Friends/FriendsInteractor.swift                     |
    +---------------------------------------------------------+-------------------------------------------------------+

    That was just a dry-run. If this looks good to you, don't forget to add --do-it

Note that generating a new module will never touch your Xcode project, but it's just a matter of dragging the resulting folder onto Xcode. 

### Additional options/overrides when generating modules

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

### Notes about the bundled `viper_table` template set

1. The `RemoteDataManager` makes use of `Alamofire` and `ObjectMapper`
2. The `LocalDataManager` makes use of `Core Data`
3. The `Interactor` and `RemoteDataManager` talks to each other using promises via `Hydra`
3. You'll notice there aren't any mention of segues here, but Storyboards and Scenes are in. 
4. The template makes use of some Swift extensions, all of which are made available in `.molt/swift_helpers`

To appreciate, please see the sample rendered source code for [Friends](https://github.com/MarcoCabazal/Molt/tree/development/sample_output).

### TODOs

1. Demo a working app done created using generators
1. Write more comprehensive tests

### Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/MarcoCabazal/molt. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

### License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

### Code of Conduct

Everyone interacting in the Molt project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/darthmarku/molt/blob/master/CODE_OF_CONDUCT.md).
