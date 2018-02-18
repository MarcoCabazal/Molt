//
//  APIError.swift
//  YATodo
//
//  Created by Marco Cabazal on 2/14/18.
//  Copyright © 2018 The Chill Mill, Inc. All rights reserved.
//

import Alamofire
import SwiftyJSON

enum APIError: DisplayableError {
  case connectivityError
  case unknown

  var title: String {
    return "API Error"
  }

  var message: String {
    switch self {
    case .connectivityError:
      return "Couldn't connect to the server"
    case .unknown:
      return "Something went wrong."
    }
  }
}
