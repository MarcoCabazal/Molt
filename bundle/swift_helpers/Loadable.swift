//
//  Loadable.swift
//  YATodo
//
//  Created by Marco Cabazal on 2/3/18.
//  Copyright © 2018 The Chill Mill, Inc. All rights reserved.
//

import UIKit
import PKHUD

protocol Loadable: class {
  func show(error: Error)
  func showLoadingIndicator()
  func hideLoadingIndicator()
}

extension UIViewController: Loadable {

  func show(error: Error) {
    switch error {
    case let error as DisplayableError:
      HUD.flash(.labeledError(title: error.title, subtitle: error.message), delay: 5.0)
    default:
      // TODO: error is not displayable so log specifics of error instead
      HUD.flash(.labeledError(title: "Ooops", subtitle: "Something is not cooperating"), delay: 5.0)
    }
  }

  func showLoadingIndicator() {
    HUD.show(.progress)
  }

  func hideLoadingIndicator() {
    HUD.hide()
  }
}
