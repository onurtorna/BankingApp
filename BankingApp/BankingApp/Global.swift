//
//  Global.swift
//  BankingApp
//
//  Created by Onur Torna on 30.11.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import Foundation

class Global {

    enum Network {
        static let defaultUsername = "106901"
        static let defaultPassword = "MTYzYmZkNjZiZmJiMTg2M2IwNjU2Nzk5NzI5OTVjNGY="
    }

    enum ErrorKey: String {
        case message
        case errorCode
        case status
    }

    enum Storyboard {
        static let landing = "Landing"
    }
}
