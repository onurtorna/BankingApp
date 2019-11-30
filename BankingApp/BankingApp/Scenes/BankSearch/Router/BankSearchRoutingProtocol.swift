//
//  BankSearchRoutingProtocol.swift
//  BankingApp
//
//  Created by Onur Torna on 1.12.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import UIKit

protocol BankSearchRoutingProtocol {

    /// Navigates to banks search result page with entered fields
    /// - Parameters:
    ///   - viewController: Source view controller
    ///   - enteredFields: Entered search fields
    func viewControllerDidRequestBankSearch(_ viewController: UIViewController,
                                            enteredFields: SearchBICFields)
}
