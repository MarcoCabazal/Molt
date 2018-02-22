//
//  FriendsProtocols.swift
//  CapoRegime
//
//  Created by Tom Hagen on 19/02/2018.
//  Copyright © 2018 Genco Olive Oil Imports. All rights reserved.
//

import UIKit
import Hydra

// MARK: Called by VIEW -> Implemented BY PRESENTER
protocol FriendsPresenterProtocol: class {
  var view: FriendsViewProtocol? { get set }
  var wireframe: FriendsWireframeProtocol? { get set }
  var interactor: FriendsInteractorProtocol? { get set }

  func viewDidLoad()

  // datasource
  var numberOfSection: Int { get }
  func numberOfRows(in section: Int) -> Int
  func content(at row: Int) -> <FriendModel>?

  func process(object: FriendModel)
}

// MARK: PRESENTER -> INTERACTOR
protocol FriendsInteractorProtocol: class {
  var presenter: FriendsInteractorOutputProtocol? { get set }
  var localDataManager: FriendsLocalDataManagerProtocol? { get set }
  var remoteDataManager: FriendsRemoteDataManagerProtocol? { get set }

  func retrieveData()
}

// MARK: INTERACTOR -> REMOTEDATAMANAGER
protocol FriendsRemoteDataManagerProtocol: class {
  func retrieveDataFromAPI() -> Promise<[FriendModel]>
}

// MARK: INTERACTOR -> LOCALDATAMANAGER
protocol FriendsLocalDataManagerProtocol: class {
  func retrieveDataFromStorage() -> Promise<[Friend]>
  func saveEntity(id: Int, title: String) -> Promise<Void>
}

// MARK: INTERACTOR -> PRESENTER
protocol FriendsInteractorOutputProtocol: class {
  func present(data: [FriendModel])
  func present(error: Error)
}

// MARK: PRESENTER -> VIEW
protocol FriendsViewProtocol: Loadable {
  func render()
}

// MARK: PRESENTER -> WIREFRAME
protocol FriendsWireframeProtocol: class {
  static func prepareModule() -> UIViewController
  func navigate(to object: FriendModel, from view: FriendsViewProtocol)
}
