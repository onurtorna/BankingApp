//
//  LandingRouter.swift
//  BankingApp
//
//  Created by Onur Torna on 30.11.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import UIKit

final class LandingRouter: LandingRoutingProtocol {

    func viewControllerDidRequestBankSearch(_ viewController: UIViewController) {
        let nextStoryBoard = UIStoryboard(name: Global.Storyboard.bankSearch, bundle: nil)
        guard let nextViewController = nextStoryBoard.instantiateInitialViewController() else { return }
        viewController.navigationController?.pushViewController(nextViewController, animated: true)
    }

    func viewControllerDidRequestBICIBANValidation(_ viewController: UIViewController) {
        // TODO: To be implemented
    }
}
