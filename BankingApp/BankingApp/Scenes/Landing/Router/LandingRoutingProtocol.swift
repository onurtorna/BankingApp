//
//  LandingRoutingProtocol.swift
//  BankingApp
//
//  Created by Onur Torna on 30.11.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import UIKit

protocol LandingRoutingProtocol {

    /// Navigates to bank search screen
    /// - Parameter viewController: Source view controller
    func viewControllerDidRequestBankSearch(_ viewController: UIViewController)

    /// Navigates to BIC and IBAN validation screen
    /// - Parameter viewController: Source view controller
    func viewControllerDidRequestBICIBANValidation(_ viewController: UIViewController)
}
