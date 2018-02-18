//
//  FriendModel.swift
//  CapoRegime
//
//  Created by Tom Hagen on 19/02/2018.
//  Copyright © 2018 Genco Olive Oil Imports. All rights reserved.
//

import Foundation
import ObjectMapper

struct FriendModel {
  var id = 0
  var title = ""
}

extension FriendModel: Mappable {

  init?(map: Map) { }

  mutating func mapping(map: Map) {
    id        <- map["id"]
    title     <- map["title"]
  }
}
