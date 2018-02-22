//
//  FriendsPresenter.swift
//  CapoRegime
//
//  Created by Tom Hagen on 19/02/2018.
//  Copyright © 2018 Genco Olive Oil Imports. All rights reserved.
//

final class FriendsPresenter {

  weak var view: FriendsViewProtocol?
  var wireframe: FriendsWireframeProtocol?
  var interactor: FriendsInteractorProtocol?
  var dataSource: [FriendModel] = []
}

// MARK: CALLED BY VIEW
extension FriendsPresenter: FriendsPresenterProtocol {

  func viewDidLoad() {
    view?.showLoadingIndicator()
    interactor?.retrieveData()
  }

  var numberOfSection: Int { return self.dataSource.count + 1  }

  func numberOfRows(in section: Int) -> Int {
    return dataSource.count
  }

  func content(at row: Int) -> FriendModel? {
    return dataSource[row]
  }

  func process(object: FriendModel) {
    guard let view = view else { return }
    wireframe?.navigate(to: object, from: view)
  }
}

// MARK: CALLED BY INTERACTOR
extension FriendsPresenter: FriendsInteractorOutputProtocol {

  func present(data: [FriendModel]) {
    self.dataSource = data
    view?.hideLoadingIndicator()
    view?.render()
  }

  func present(error: Error) {
    view?.hideLoadingIndicator()
    view?.show(error: error)
  }
}
