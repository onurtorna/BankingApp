//
//  BAError.swift
//  BankingApp
//
//  Created by Onur Torna on 30.11.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import Foundation

struct BAError: Codable {

    /// Error message coming from the service
    var message: String?

    /// Error code to categorize error
    var code: String?

    var status: Bool?

    enum CodingKeys: String, CodingKey {
        case message
        case code = "errorCode"
        case status
    }
}
