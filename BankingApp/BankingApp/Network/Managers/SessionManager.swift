//
//  SessionManager.swift
//  BankingApp
//
//  Created by Onur Torna on 30.11.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import Foundation

final class SessionManager {

    static let shared = SessionManager()

    private init() {
        // Left blank intentionally
    }

    /// Username to use in network session
    private(set) var username = ""

    /// Password for network session
    private(set) var password = ""

}

// MARK: - Public
extension SessionManager {

    func setNetworkCredentials(username: String, password: String) {
        self.username = username
        self.password = password
    }
}
