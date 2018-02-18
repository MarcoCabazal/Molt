//
//  ISODateTransform.swift
//  YATodo
//
//  Created by Marco Cabazal on 2/4/18.
//  Copyright © 2018 The Chill Mill, Inc. All rights reserved.
//

import ObjectMapper

public struct ISODateTransform: TransformType {

  public func transformFromJSON(_ value: Any?) -> Date? {
    guard let dateString = value as? String else { return nil }
    let formatter = DateFormatter()
    formatter.dateFormat = "YYYY-MM-dd'T'HH:mm:ss.SSSZ"
    return formatter.date(from: dateString)
  }

  public func transformToJSON(_ value: Date?) -> String? {
    guard let dateString = value else { return nil }
    let formatter = DateFormatter()
    formatter.dateFormat = "YYYY-MM-dd'T'HH:mm:ss.SSSZ"
    return formatter.string(from: dateString)
  }
}
