//
//  FriendsLocalDataManager.swift
//  CapoRegime
//
//  Created by Tom Hagen on 19/02/2018.
//  Copyright © 2018 Genco Olive Oil Imports. All rights reserved.
//

import CoreData
import Hydra

// MARK: CALLED BY INTERACTOR
class FriendsLocalDataManager: FriendsLocalDataManagerProtocol {

  func retrieveDataFromStorage() -> Promise<[Friend]>  {
    return Promise<[Friend]>(in: .main) { resolve, reject, _ in
      guard let moc = CoreDataStore.moc else {
        reject(PersistenceError.mocNotFound)
        return
      }
      do {
        let request: NSFetchRequest<Friend> = NSFetchRequest(entityName: Friend.id)
        resolve(try moc.fetch(request))
      } catch {
        reject(PersistenceError.objectNotFound)
      }
    }
  }

  func saveEntity(id: Int, title: String) -> Promise<Void> {
    return Promise<Void>(in: .main) { resolve, reject, _ in
      guard let moc = CoreDataStore.moc else {
        reject(PersistenceError.mocNotFound)
        return
      }

      do {
        if let entity = NSEntityDescription.entity(forEntityName: Friend.id, in: moc) {
          let object = Friend(entity: entity, insertInto: moc)
          object.id = Int32(id)
          object.title = title
          try moc.save()
          resolve(())
        }
      } catch {
        reject(PersistenceError.couldNotSaveObject)
      }
    }
  }
}
