//
//  Dictionary+JSON.swift
//  BankingApp
//
//  Created by Onur Torna on 30.11.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import Foundation

extension Dictionary where Key == String {

    mutating func addObjectIfExists(key: String,
                                    object: Value?) {

        guard let object = object else { return }

        self[key] = object
    }
}
