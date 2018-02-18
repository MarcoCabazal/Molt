//
//  FriendWireFrame.swift
//  CapoRegime
//
//  Created by Tom Hagen on 19/02/2018.
//  Copyright © 2018 Genco Olive Oil Imports. All rights reserved.
//

import UIKit

final class FriendWireFrame: FriendWireFrameProtocol {

  static func prepareModule(with object: FriendModel) -> UIViewController {
    let view = FriendView.instantiate(from: .main)

    let presenter: FriendPresenterProtocol = FriendPresenter()
    let wireFrame = FriendWireFrame()

    view.presenter = presenter
    presenter.view = view
    presenter.dataSource = object
    presenter.wireFrame = wireFrame

    return view
  }
}
