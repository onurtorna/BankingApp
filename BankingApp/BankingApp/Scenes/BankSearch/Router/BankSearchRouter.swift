//
//  BankSearchRouter.swift
//  BankingApp
//
//  Created by Onur Torna on 1.12.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import UIKit

final class BankSearchRouter: BankSearchRoutingProtocol {

    func viewControllerDidRequestBankSearch(_ viewController: UIViewController,
                                            enteredFields: SearchBICFields) {
        let nextStoryBoard = UIStoryboard(name: Global.Storyboard.bankSearch, bundle: nil)
        guard let nextViewController = nextStoryBoard.instantiateViewController(withIdentifier: BankSearchResultViewController.reuseIdentifier) as? BankSearchResultViewController else { return }
        let state = BankSearchResultState(enteredFields: enteredFields)
        let dataController = BankSearchResultDataController()
        nextViewController.viewModel = BankSearchResultViewModel(state: state, dataController: dataController)
        viewController.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
