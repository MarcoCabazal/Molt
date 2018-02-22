//
//  FriendProtocols.swift
//  CapoRegime
//
//  Created by Tom Hagen on 19/02/2018.
//  Copyright © 2018 Genco Olive Oil Imports. All rights reserved.
//

import UIKit

// MARK: Called by VIEW -> Implemented BY PRESENTER
protocol FriendPresenterProtocol: class {
  weak var view: FriendViewProtocol? { get set }
  weak var wireframe: FriendWireframeProtocol? { get set }
  var dataSource: FriendModel? { get set }

  func viewDidLoad()
}

// MARK: PRESENTER -> VIEW
protocol FriendViewProtocol: Loadable {
  func render(content: FriendModel?)
}

// MARK: PRESENTER -> WIREFRAME
protocol FriendWireframeProtocol: class {
  static func prepareModule(with object: FriendModel) -> UIViewController
}
