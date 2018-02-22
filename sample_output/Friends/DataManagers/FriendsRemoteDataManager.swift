//
//  FriendsRemoteDataManager.swift
//  CapoRegime
//
//  Created by Tom Hagen on 19/02/2018.
//  Copyright © 2018 Genco Olive Oil Imports. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import Hydra

// MARK: CALLED BY INTERACTOR
class FriendsRemoteDataManager: FriendsRemoteDataManagerProtocol {

  func retrieveDataFromAPI() -> Promise<[FriendModel]> {
    return Promise<[FriendModel]>(in: .background) { resolve, reject, _ in
      Alamofire.request(APIRouter.friendmodel)
        .validate()
        .responseArray(keyPath: "friends") { (response: DataResponse<[FriendModel]>) in

          switch response.result {
          case .success(let data):
            resolve(data)
          case .failure:
            reject(APIError.unknown)
          }
      }
    }
  }
}
