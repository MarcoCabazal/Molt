//
//  FriendWireframe.swift
//  CapoRegime
//
//  Created by Tom Hagen on 19/02/2018.
//  Copyright © 2018 Genco Olive Oil Imports. All rights reserved.
//

import UIKit

final class FriendWireframe: FriendWireframeProtocol {

  static func prepareModule(with object: FriendModel) -> UIViewController {
    let view = FriendView.instantiate(from: .main)

    let presenter: FriendPresenterProtocol = FriendPresenter()
    let wireframe = FriendWireframe()

    view.presenter = presenter
    presenter.view = view
    presenter.dataSource = object
    presenter.wireframe = wireframe

    return view
  }
}
