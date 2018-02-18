//
//  Identifiable.swift
//  YATodo
//
//  Created by Marco Cabazal on 2/3/18.
//  Copyright © 2018 The Chill Mill, Inc. All rights reserved.
//

import UIKit
import CoreData

// swiftlint:disable identifier_name
protocol Identifiable {
  static var id: String { get }
}

extension Identifiable {

  // return an introspective string representation of the invoking class, which is
  // generally a shorter alternative to using R.swift's R.nib.viewClass.identifier
  static var id: String {
    return String(describing: self)
  }
}
// swiftlint:enable identifier_name

extension UIViewController: Identifiable { }
extension UIView: Identifiable { }
extension NSManagedObject: Identifiable { }
