//
//  FriendsWireFrame.swift
//  CapoRegime
//
//  Created by Tom Hagen on 19/02/2018.
//  Copyright © 2018 Genco Olive Oil Imports. All rights reserved.
//

import UIKit

final class FriendsWireFrame {

  static func prepareModule() -> UIViewController {
    let navController = UINavigationController.instantiate(from: .main, identifier: "mainNavigationController")

    guard let view = navController.childViewControllers.first as? FriendsView else {
      return UIViewController()
    }

    let presenter: FriendsPresenterProtocol & FriendsInteractorOutputProtocol = FriendsPresenter()
    let interactor: FriendsInteractorProtocol = FriendsInteractor()
    let wireFrame: FriendsWireFrameProtocol = FriendsWireFrame()
    let localDataManager: FriendsLocalDataManagerProtocol = FriendsLocalDataManager()
    let remoteDataManager: FriendsRemoteDataManagerProtocol = FriendsRemoteDataManager()

    // INTEGRATION
    view.presenter = presenter
    presenter.view = view
    presenter.wireFrame = wireFrame
    presenter.interactor = interactor
    interactor.presenter = presenter
    interactor.localDataManager = localDataManager
    interactor.remoteDataManager = remoteDataManager

    return navController
  }
}

// MARK: NAVIGATION
extension FriendsWireFrame: FriendsWireFrameProtocol {

  func navigate(to object: FriendModel, from view: FriendsViewProtocol) {
    guard let sourceView = view as? UIViewController else { return }

    let detailVC = FriendsDetailWireFrame.prepareModule(with: object)
    sourceView.navigationController?.pushViewController(detailVC, animated: true)
  }
}
