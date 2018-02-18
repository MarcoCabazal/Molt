//
//  FriendsView.swift
//  CapoRegime
//
//  Created by Tom Hagen on 19/02/2018.
//  Copyright © 2018 Genco Olive Oil Imports. All rights reserved.
//

import UIKit

class FriendsView: UIViewController {

  var presenter: FriendsPresenterProtocol?

  @IBOutlet weak var tableView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.tableFooterView = UIView()
    tableView.register(FriendCell.nib, forCellReuseIdentifier: FriendCell.id)
    presenter?.viewDidLoad()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    if let selectedRow = tableView.indexPathForSelectedRow {
      tableView.deselectRow(at: selectedRow, animated: true)
    }
  }
}

// MARK: CALLED BY PRESENTER
extension FriendsView: FriendsViewProtocol {

  func render() {
    tableView.reloadData()
  }
}

// MARK: UITABLEVIEW DATASOURCE
extension FriendsView: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter?.numberOfRows(in: section) ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let content = presenter?.content(at: indexPath.row),
      let cell = tableView.dequeueReusableCell(withIdentifier: FriendCell.id, for: indexPath) as? FriendCell else {
        return tableView.dequeueReusableCell(withIdentifier: FriendCell.id, for: indexPath)
    }

    cell.configure(with: content)
    return cell
  }
}

// MARK: UITABLEVIEW DELEGATE
extension FriendsView: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let content = presenter?.content(at: indexPath.row) else { return }
    presenter?.process(object: content)
  }
}
