//
//  FriendView.swift
//  CapoRegime
//
//  Created by Tom Hagen on 19/02/2018.
//  Copyright © 2018 Genco Olive Oil Imports. All rights reserved.
//

import UIKit

class FriendView: UIViewController {

  var presenter: FriendPresenterProtocol?

  @IBOutlet weak var titleLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.viewDidLoad()
  }
}

// MARK: CALLED BY PRESENTER
extension FriendView: FriendViewProtocol {

  func render(content: FriendModel?) {
    guard let content = content else { return }
    titleLabel?.text = content.title
  }
}
