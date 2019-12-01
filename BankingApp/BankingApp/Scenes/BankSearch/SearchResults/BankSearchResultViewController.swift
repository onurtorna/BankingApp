//
//  BankSearchResultViewController.swift
//  BankingApp
//
//  Created by Onur Torna on 1.12.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import UIKit

final class BankSearchResultViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var loadMoreButton: UIButton!

    var viewModel: BankSearchResultViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeViews()

        viewModel.fetchBICResults()
    }
}

// MARK: - Helpers
private extension BankSearchResultViewController {

    func initializeViews() {
        loadMoreButton.isHidden = true
    }
}
