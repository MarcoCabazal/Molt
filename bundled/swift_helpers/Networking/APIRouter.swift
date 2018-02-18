//
//  Endpoints.swift
//  CapoRegime
//
//  Created by Marco Cabazal on 18 Jan 2017.
//  Copyright © 2017 The Chill Mill, Inc. All rights reserved.
//

import Alamofire

struct Config {
  static let API = "http://caporegime.rb/v1"
}

enum APIRouter: URLRequestConvertible {
  case friends

  private var path: String {
    switch self {
    case .friends:
      return "/friends"
    }
  }

  private var method: HTTPMethod {
    switch self {
    case .friends:
      return .get
    }
  }

  private var parameters: Parameters? {
    return nil
  }

  private var headers: [String: String] {
    return [ "Content-Type": "application/json" ]
  }

  func asURLRequest() throws -> URLRequest {
    let baseURL = try Config.API.asURL()
    var urlRequest = URLRequest(url: baseURL.appendingPathComponent(path))

    urlRequest.httpMethod = method.rawValue

    for (header, value) in headers {
      urlRequest.setValue(value, forHTTPHeaderField: header)
    }

    urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)

    return urlRequest
  }
}
