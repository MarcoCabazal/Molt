//
//  FriendsInteractor.swift
//  CapoRegime
//
//  Created by Tom Hagen on 19/02/2018.
//  Copyright © 2018 Genco Olive Oil Imports. All rights reserved.
//

final class FriendsInteractor {
  weak var presenter: FriendsInteractorOutputProtocol?
  var localDataManager: FriendsLocalDataManagerProtocol?
  var remoteDataManager: FriendsRemoteDataManagerProtocol?
}

// MARK: CALLED BY PRESENTER
extension FriendsInteractor: FriendsInteractorProtocol {

  func retrieveData() {
    localDataManager?.retrieveDataFromStorage().then({ [weak self] persistedData in
      let data: [FriendModel] = persistedData.map {
        return FriendModel(id: Int($0.id), title: $0.title ?? "", dueDate: $0.dueDate)
      }

      if !data.isEmpty {
        self?.presenter?.present(data: data)
      } else {
        self?.retrieveDataFromAPI()
      }
    }).catch({ [weak self] error in
      self?.presenter?.present(error: error)
    })
  }
}

extension FriendsInteractor {

  fileprivate func retrieveDataFromAPI() {
    remoteDataManager?.retrieveDataFromAPI().then({ [weak self] data in
      self?.persist(data: data)
      self?.presenter?.present(data: data)
    }).catch({ [weak self] error in
      self?.presenter?.present(error: error)
    })
  }

  fileprivate func persist(data: [FriendModel]) {
    for item in data {
      localDataManager?.saveEntity(id: item.id, title: item.title).catch({ [weak self] error in
        self?.presenter?.present(error: error)
      })
    }
  }
}
