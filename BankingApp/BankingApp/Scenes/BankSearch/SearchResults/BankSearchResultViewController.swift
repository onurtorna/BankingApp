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

        viewModel.stateChangeHandler = { [weak self] change in
            self?.handleState(change)
        }

        viewModel.fetchBICResults()
    }
}

// MARK: - Helpers
private extension BankSearchResultViewController {

    func handleState(_ change: BankSearchResultState.Change) {
        switch change {
        case .itemsFetched:
            tableView.reloadData()
            loadMoreButton.isHidden = true

        case .errorReceived(message: let message):
            // TODO: Show error message
            break

        case .canLoadMoreState(canLoadMore: let canLoadMore):
            // TODO: Show/Hide
            break
        }
    }

    func initializeViews() {
        loadMoreButton.isHidden = true
        tableView.register(BankResultTableViewCell.self, forCellReuseIdentifier: BankResultTableViewCell.reuseIdentifier)
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDataSource
extension BankSearchResultViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BankResultTableViewCell.reuseIdentifier,
                                                       for: indexPath) as? BankResultTableViewCell else {
                                                        fatalError("BankResultTableViewCell could not dequeued correctly")
        }
        let item = viewModel.item(at: indexPath.row)
        cell.populate(with: item)
        return cell
    }

}
