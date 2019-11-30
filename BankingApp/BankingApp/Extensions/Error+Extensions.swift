//
//  Error+Extensions.swift
//  BankingApp
//
//  Created by Onur Torna on 30.11.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import Foundation

extension Error {

    /// Error message to show to user
    var am_message: String? {
        let error = self as NSError
        return error.userInfo[Global.ErrorKey.message] as? String
    }
}
