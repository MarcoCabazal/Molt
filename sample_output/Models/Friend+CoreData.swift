//
//  Friend+CoreData.swift
//  CapoRegime
//
//  Created by Tom Hagen on 19/02/2018.
//  Copyright © 2018 Genco Olive Oil Imports. All rights reserved.
//

import Foundation
import CoreData

extension Friend {

  @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
    return NSFetchRequest<Friend>(entityName: Friend.id)
  }

  @NSManaged public var id: Int32
  @NSManaged public var title: String?
}
