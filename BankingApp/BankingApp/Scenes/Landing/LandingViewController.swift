//
//  LandingViewController.swift
//  BankingApp
//
//  Created by Onur Torna on 30.11.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import UIKit

final class LandingViewController: UIViewController {

    var router: LandingRoutingProtocol = LandingRouter()

    override func viewDidLoad() {
        super.viewDidLoad()
        applyStyling()
        navigationItem.title = "Welcome"
    }

}

// MARK: - Actions
private extension LandingViewController {

    @IBAction func validateBICIBANButtonDidTapped(_ sender: Any) {
        router.viewControllerDidRequestBICIBANValidation(self)
    }

    @IBAction func searchForBankButtonDidTapped(_ sender: Any) {
        router.viewControllerDidRequestBankSearch(self)
    }
}

// MARK: - Helpers
private extension LandingViewController {

    func applyStyling() {
        // TODO: Styling changes might be applied here
    }
}
