//
//  SuccessResponse.swift
//  BankingApp
//
//  Created by Onur Torna on 30.11.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import Foundation

/// Base success response for the application
struct SuccessResponse<T: BaseResponse>: Decodable {

    let code: String
    let data: T
}
