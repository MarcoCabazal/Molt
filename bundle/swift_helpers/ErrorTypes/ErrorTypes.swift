//
//  ErrorTypes.swift
//  YATodo
//
//  Created by Marco Cabazal on 2/14/18.
//  Copyright © 2018 The Chill Mill, Inc. All rights reserved.
//

protocol DisplayableError: Error {
  var title: String { get }
  var message: String { get }
}
