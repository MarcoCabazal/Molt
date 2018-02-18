//
//  PersistenceError.swift
//  Yet Another Todo App (using Viper)
//
//  Created by Marco Cabazal on 18 Jan 2017.
//  Copyright © 2017 The Chill Mill, Inc. All rights reserved.
//

enum PersistenceError: DisplayableError {
  case mocNotFound
  case couldNotSaveObject
  case objectNotFound

  var title: String {
    return "Core Data Error"
  }

  var message: String {
    switch self {
    case .mocNotFound:
      return "MOC not found."
    case .couldNotSaveObject:
      return "Couldn't save object."
    case .objectNotFound:
      return "Object not found."
    }
  }
}
