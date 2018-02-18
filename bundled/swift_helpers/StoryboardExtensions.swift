//
//  StoryboardExtensions.swift
//  YATodo
//
//  Created by Marco Cabazal on 18 Jan 2017.
//  Copyright © 2018 The Chill Mill, Inc. All rights reserved.
//

import UIKit

enum Storyboard: String {
  case main = "Main"

  var storyboard: UIStoryboard {
    return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
  }

  fileprivate func viewController<T: UIViewController>(as: T.Type, identifier: String,
                                           function: String = #function, line: Int = #line, file: String = #file) -> T {

    guard let scene = storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
      fatalError("ViewController with identifier \(identifier), not found. Reference: \(self.rawValue) Storyboard.\nFile : \(file) \nLine Number : \(line) \nFunction : \(function)")
    }

    return scene
  }

  func initialViewController() -> UIViewController? {
    return storyboard.instantiateInitialViewController()
  }
}

extension UIViewController {

  static func instantiate(from storyboard: Storyboard) -> Self {
    return storyboard.viewController(as: self, identifier: self.id)
  }

  static func instantiate(from storyboard: Storyboard, identifier: String) -> Self {
    return storyboard.viewController(as: self, identifier: identifier)
  }
}

extension UITableViewCell {

  static var nib: UINib {
    return UINib(nibName: self.id, bundle: Bundle.main)
  }
}
