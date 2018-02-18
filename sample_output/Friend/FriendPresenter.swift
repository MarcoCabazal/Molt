//
//  FriendInteractor.swift
//  CapoRegime
//
//  Created by Tom Hagen on 19/02/2018.
//  Copyright © 2018 Genco Olive Oil Imports. All rights reserved.
//

final class FriendPresenter {

  weak var view: FriendViewProtocol?
  var wireFrame: FriendWireFrameProtocol?
  var dataSource: FriendModel?
}

// MARK: CALLED BY VIEW
extension FriendPresenter: FriendPresenterProtocol {

  func viewDidLoad() {
    view?.render(content: dataSource)
  }
}
