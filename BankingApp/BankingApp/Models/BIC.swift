//
//  BIC.swift
//  BankingApp
//
//  Created by Onur Torna on 30.11.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import Foundation

struct BIC: Codable {

    /// Unique identifier for BIC
    var id: String

    /// Unique country identifier
    var countryId: String

    /// Name of the bank
    var bankName: String

    /// Short adress description
    var location: String

    var blz: String

    var bicCode: String

    /// Country language code
    var countryCode: String
}
